require 'swagger_helper'

RSpec.describe 'House API' do
  path '/houses' do
    post 'Creates a house' do
      tags 'Houses'
      consumes 'application/json', 'application/xml'
      parameter name: :house, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          night_price: { type: :integer },
          city: { type: :string },
          description: { type: :string },
          photo: { type: :string }
        },
        required: %w[name address night_price description photo]
      }
      response '201', 'house created' do
        let!(:house) { FactoryBot.create(:house) }
        run_test!
      end
      response '422', 'invalid request' do
        let!(:house) { FactoryBot.build(:house, name: '') }
        run_test!
      end
    end

    get 'Retrieves all houses' do
      tags 'Houses'
      produces 'application/json', 'application/xml'
      response '200', 'houses found' do
        schema type: :array,
               items: { '$ref' => '#/components/schemas/house' }
        run_test!
      end
    end
  end

  path '/houses/{id}' do
    get 'Retrieves a house' do
      tags 'Houses'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      response '200', 'house found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 night_price: { type: :integer },
                 city: { type: :string },
                 description: { type: :string },
                 photo: { type: :string }
               },
               required: %w[id name address night_price description photo]
        let!(:id) { FactoryBot.create(:house).id }
        run_test!
      end
    end

    delete 'Delete house' do
      tags 'Houses'
      consumes 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      response '204', 'house deleted' do
        let(:id) { FactoryBot.create(:house).id }
        run_test!
      end
    end
  end
end
