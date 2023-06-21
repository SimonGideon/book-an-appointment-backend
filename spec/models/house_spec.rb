require "rails_helper"

RSpec.describe House, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:students) }
  end
end
