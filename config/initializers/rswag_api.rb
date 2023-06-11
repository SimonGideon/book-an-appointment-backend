Rswag::Api.configure do |c|

  # Specify a root folder where Swagger JSON files are located
  # This is used by the Swagger middleware to serve requests for API descriptions
  # NOTE: If you're using rswag-specs to generate Swagger, you'll need to ensure
  # that it's configured to generate files in the same folder
  c.swagger_root = Rails.root.to_s + "/swagger"
  c.swagger_filter = lambda do |swagger, _|
    swagger["info"]["description"] = "This is a House booking App that allows users to reserve a room and they will be charged per night" # Add your desired API description here
    swagger["info"]["title"] = "House Booking API"
    swagger
  end
end
