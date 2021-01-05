require 'rails_helper'

RSpec.describe "carrinhos/index", type: :view do
  before(:each) do
    assign(:carrinhos, [
      Carrinho.create!(
        user: "",
        product: "",
        quantidade: 2
      ),
      Carrinho.create!(
        user: "",
        product: "",
        quantidade: 2
      )
    ])
  end

  it "renders a list of carrinhos" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
