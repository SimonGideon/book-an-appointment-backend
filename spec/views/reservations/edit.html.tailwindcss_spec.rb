require 'rails_helper'

RSpec.describe 'reservations/edit', type: :view do
  let(:reservation) do
    Reservation.create!(
      user: nil,
      house: nil
    )
  end

  before(:each) do
    assign(:reservation, reservation)
  end

  it 'renders the edit reservation form' do
    render

    assert_select 'form[action=?][method=?]', reservation_path(reservation), 'post' do
      assert_select 'input[name=?]', 'reservation[user_id]'

      assert_select 'input[name=?]', 'reservation[house_id]'
    end
  end
end
