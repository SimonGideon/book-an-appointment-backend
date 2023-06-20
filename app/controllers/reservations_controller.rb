class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.where(user_id: current_user.id).order(:check_in)
    render json: @reservations
  end

  def house_reservations
    house = House.find(params[:id])
    render json: house.reservations.order(:check_in)
  end

  # GET /reservations/1 or /reservations/1.json
  def show
    render json: @reservation
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit; end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if check_available_dates(@reservation)
      respond_to do |format|
        if @reservation.save
          format.json { render :show, status: :created, location: @reservation }
        else
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :house_id)
  end

  def check_available_dates(reservation)
    return false if invalid_date_input(reservation) || internal_overlap(reservation)

    interval_end = Reservation.where(house_id: reservation.house_id).where('check_in >= ?',
                                                                           reservation.check_in).minimum(:check_in)
    return true if interval_end.nil? || reservation.check_out < interval_end

    interval_start = Reservation.where(house_id: reservation.house_id).where('check_out <= ?',
                                                                             reservation.check_in).maximum(:check_out)
    if interval_start.nil? && interval_end.nil?
      true
    else
      reservation.errors.add(:base,
                             'Not allowed. Your reservation duration overlaps with another already reserved duration.')
      false
    end
  end

  def overlap(house_id, date)
    Reservation.where(house_id:).each do |r|
      return true if r.check_in <= date && r.check_out >= date
    end
    false
  end

  def internal_overlap(reservation)
    return false unless overlap(reservation.house_id, reservation.check_in) || overlap(reservation.house_id, reservation.check_out)

    reservation.errors.add(:base,
                           'Not allowed. Your reservation duration overlaps with another already reserved duration.')
    true
  end

  def invalid_date_input(reservation)
    # check if check_in and check_out overlap with already existed reservation
    if reservation.check_in.nil? || reservation.check_out.nil?
      reservation.errors.add(:base, 'invalid input data of type date')
      true
    elsif reservation.check_in <= Date.today
      reservation.errors.add(:base, 'Cannot reserve at past date or today')
      true
    else
      false
    end
  end
end
