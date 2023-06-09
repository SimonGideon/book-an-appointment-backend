class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  # GET /reservations/1 or /reservations/1.json
  def show; end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit; end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
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
        format.html { redirect_to reservation_url(@reservation), notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
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
    params.require(:reservation).permit(:check_in, :check_out, :user_id, :house_id)
  end

  def check_available_dates(reservation)
    # check if check_in and check_out overlap with already existed reservation 
    if reservation.check_in.nil? || reservation.check_out.nil?
      reservation.errors.add(:base, "invalid input data of type date")
      return false
    end
    if reservation.check_in <=  Date.today
      reservation.errors.add(:base, "Cannot reserve at past date or today")
      return false
    end
    if overlap(reservation.check_in) || overlap(reservation.check_out)
      reservation.errors.add(:base, "Not allowed. Your reservation duration overlaps with another already reserved duration.")
      return false
    end
    interval_end = Reservation.where(house_id: reservation.house_id).where('check_in >= ?', reservation.check_in).minimum(:check_in)
    interval_start = Reservation.where(house_id: reservation.house_id).where('check_out <= ?', reservation.check_in).maximum(:check_out)
    if interval_start.nil? && interval_end.nil?
      return true
    elsif interval_end.nil?
      return true
    elsif reservation.check_out < interval_end
      return true
    else
      reservation.errors.add(:base, "Not allowed. Your reservation duration overlaps with another already reserved duration.")
      return false
    end
  end 
  
  def overlap(date)
    Reservation.all.each do |r|
      if r.check_in <= date && r.check_out >= date 
        return true 
      end 
    end
    return false
  end

end
