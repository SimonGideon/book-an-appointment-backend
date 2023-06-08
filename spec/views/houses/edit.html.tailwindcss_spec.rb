require 'rails_helper'

RSpec.describe 'houses/edit', type: :view do
  let(:house) do
    House.create!(
      name: 'MyString',
      address: 'MyString',
      description: 'MyText',
      city: 'MyString',
      photo: 'MyText',
      night_price: 1
    )
  end

  before(:each) do
    assign(:house, house)
  end

  it 'renders the edit house form' do
    render

    assert_select 'form[action=?][method=?]', house_path(house), 'post' do
      assert_select 'input[name=?]', 'house[name]'

      assert_select 'input[name=?]', 'house[address]'

      assert_select 'textarea[name=?]', 'house[description]'

      assert_select 'input[name=?]', 'house[city]'

      assert_select 'textarea[name=?]', 'house[photo]'

      assert_select 'input[name=?]', 'house[night_price]'
    end
  end
end
