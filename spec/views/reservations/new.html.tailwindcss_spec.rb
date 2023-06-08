require 'rails_helper'

RSpec.describe 'reservations/new', type: :view do
  before(:each) do
    assign(:reservation, Reservation.new(
                           user: nil,
                           house: nil
                         ))
  end

  it 'renders new reservation form' do
    render

    assert_select 'form[action=?][method=?]', reservations_path, 'post' do
      assert_select 'input[name=?]', 'reservation[user_id]'

      assert_select 'input[name=?]', 'reservation[house_id]'
    end
  end
end
