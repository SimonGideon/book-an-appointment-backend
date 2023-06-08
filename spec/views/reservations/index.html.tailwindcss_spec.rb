require 'rails_helper'

RSpec.describe 'reservations/index', type: :view do
  before(:each) do
    assign(:reservations, [
             Reservation.create!(
               user: nil,
               house: nil
             ),
             Reservation.create!(
               user: nil,
               house: nil
             )
           ])
  end

  it 'renders a list of reservations' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
