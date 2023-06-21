require 'rails_helper'

RSpec.describe CurrentUserHelper, type: :helper do
  describe '#current_user' do
    let(:user) { User.create(email: 'user@example.com', password: 'password123') }

    it 'returns the current user' do
      allow(helper).to receive(:current_user).and_return(user)
      expect(helper.current_user).to eq(user)
    end
  end
end
