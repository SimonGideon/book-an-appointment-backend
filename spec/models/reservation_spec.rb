require "rails_helper"

RSpec.describe Reservation, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should belong_to(:house) }
  end
end
