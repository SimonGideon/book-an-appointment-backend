require 'rails_helper'

RSpec.describe 'houses/index', type: :view do
  before(:each) do
    assign(:houses, [
             House.create!(
               name: 'Name',
               address: 'Address',
               description: 'MyText',
               city: 'City',
               photo: 'MyText',
               night_price: 2
             ),
             House.create!(
               name: 'Name',
               address: 'Address',
               description: 'MyText',
               city: 'City',
               photo: 'MyText',
               night_price: 2
             )
           ])
  end

  it 'renders a list of houses' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Address'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('City'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
