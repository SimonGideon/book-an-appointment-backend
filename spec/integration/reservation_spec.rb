require 'swagger_helper'

describe ReservationsController, type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:house) { FactoryBot.create(:house) }

  path '/reservations' do
    get 'Retrieves a list of reservations' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'Reservation list found' do
        run_test! do
          expect(response).to have_http_status(200)
        end
      end
    end

    post 'Creates a new reservation' do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          check_in: { type: :string, format: :date },
          check_out: { type: :string, format: :date },
          user_id: { type: :integer },
          house_id: { type: :integer }
        },
        required: %w[check_in check_out user_id house_id]
      }

      response '201', 'Reservation Created Successfully' do
        let(:reservation) do
          {
            check_in: '2023-06-15',
            check_out: '2023-06-20',
            user_id: user.id,
            house_id: house.id
          }
        end

        run_test! do
          expect(response).to have_http_status(201)
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:reservation) do
          {
            check_in: '2023-06-22',
            check_out: '2023-06-20',
            user_id: user.id,
            house_id: house.id
          }
        end

        run_test! do
          expect(response).to have_http_status(422)
        end
      end
    end
  end

  path '/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Reservation Found' do
        let(:reservation) { FactoryBot.build(:reservation, user:, house:) }
        let(:id) { reservation.id }

        before do
          reservation.save
        end

        run_test! do
          expect(response).to have_http_status(200)
        end
      end

      response '404', 'Not Found' do
        let(:id) { 999 }

        before do
          allow(Reservation).to receive(:find).and_raise(ActiveRecord::RecordNotFound.new("Couldn't find Reservation with 'id'=#{id}"))
        end

        run_test! do
          expect(response).to have_http_status(404)
        end
      end
    end

    put 'Updates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          check_in: { type: :string, format: :date },
          check_out: { type: :string, format: :date },
          user_id: { type: :integer },
          house_id: { type: :integer }
        },
        required: %w[check_in check_out user_id house_id]
      }

      response '200', 'Reservation Updated Successfully' do
        let(:reservation) { FactoryBot.build(:reservation, user:, house:) }
        let(:id) { reservation.id }
        let(:reservation_params) do
          {
            check_in: '2023-06-15',
            check_out: '2023-06-20',
            user_id: user.id,
            house_id: house.id
          }
        end

        before do
          reservation.save
        end

        run_test! do
          expect(response).to have_http_status(200)
        end
      end

      response '404', 'Reservation Not Found' do
        let(:id) { 999 }
        let(:reservation) { Reservation.new } # Add this line to declare the reservation parameter

        let(:reservation_params) do
          {
            check_in: '2023-06-15',
            check_out: '2023-06-20',
            user_id: user.id,
            house_id: house.id
          }
        end

        before do
          allow(Reservation).to receive(:find).and_raise(ActiveRecord::RecordNotFound.new("Couldn't find Reservation with 'id'=#{id}"))
        end

        run_test!
      end
    end

    delete 'Deletes a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'Deleted' do
        let(:reservation) { FactoryBot.build(:reservation, user:, house:) }
        let(:id) { reservation.id }

        before do
          reservation.save
        end

        run_test! do
          expect(response).to have_http_status(204)
        end
      end

      response '404', 'Reservation with ID Not Found' do
        let(:id) { 999 }

        before do
          allow(Reservation).to receive(:find).and_raise(ActiveRecord::RecordNotFound.new("Couldn't find Reservation with 'id'=#{id}"))
        end

        run_test! do
          expect(response).to have_http_status(404)
        end
      end
    end

    patch 'Update a reservation' do
      patch 'Update a reservation' do
        tags 'Reservations'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            check_in: { type: :string, format: :date },
            check_out: { type: :string, format: :date },
            user_id: { type: :integer },
            house_id: { type: :integer }
          },
          required: %w[check_in check_out user_id house_id]
        }

        response '200', 'Reservation Updated Successfully' do
          let(:existing_reservation) { FactoryBot.build(:reservation, user:, house:) }
          let(:id) { existing_reservation.id }
          let(:updated_reservation) do
            {
              check_in: '2023-06-15',
              check_out: '2023-06-20',
              user_id: user.id,
              house_id: house.id
            }
          end

          let(:reservation) { updated_reservation }

          before do
            reservation = Reservation.find(id)
            reservation.update(updated_reservation)
          end
          run_test!
        end
      end
    end
  end
end
