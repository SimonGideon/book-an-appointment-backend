require 'rails_helper'

RSpec.describe 'houses/show', type: :view do
  before(:each) do
    assign(:house, House.create!(
                     name: 'Name',
                     address: 'Address',
                     description: 'MyText',
                     city: 'City',
                     photo: 'MyText',
                     night_price: 2
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
