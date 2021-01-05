require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        nome: "Nome"
      ),
      Category.create!(
        nome: "Nome"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", text: "Nome".to_s, count: 2
  end
end
