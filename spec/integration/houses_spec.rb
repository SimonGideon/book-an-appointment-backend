require "swagger_helper"

RSpec.
  describe "House API" do
  path "/houses" do
    post "Creates a house" do
      tags "Houses"
      consumes "application/json", "application/xml"
      parameter name: :house, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          night_price: { type: :integer },
          city: { type: :string },
          description: { type: :string },
          photo: { type: :string },
        },
        required: %w[name address night_price description photo],
      }
      response "201", "house created" do
        let!(:house) { FactoryBot.create(:house) }
        run_test!
      end
      response "422", "invalid request" do
        let!(:house) { FactoryBot.build(:house, name: "") }
        run_test!
      end
    end
  end
end
