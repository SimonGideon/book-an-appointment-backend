require 'rails_helper'

RSpec.describe 'houses/new', type: :view do
  before(:each) do
    assign(:house, House.new(
                     name: 'MyString',
                     address: 'MyString',
                     description: 'MyText',
                     city: 'MyString',
                     photo: 'MyText',
                     night_price: 1
                   ))
  end

  it 'renders new house form' do
    render

    assert_select 'form[action=?][method=?]', houses_path, 'post' do
      assert_select 'input[name=?]', 'house[name]'

      assert_select 'input[name=?]', 'house[address]'

      assert_select 'textarea[name=?]', 'house[description]'

      assert_select 'input[name=?]', 'house[city]'

      assert_select 'textarea[name=?]', 'house[photo]'

      assert_select 'input[name=?]', 'house[night_price]'
    end
  end
end
