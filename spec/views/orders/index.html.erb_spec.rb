require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        user: "",
        product: "",
        quantidade: 2,
        numero_pedido: 3,
        preco: 4.5,
        endereco: ""
      ),
      Order.create!(
        user: "",
        product: "",
        quantidade: 2,
        numero_pedido: 3,
        preco: 4.5,
        endereco: ""
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.5.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
