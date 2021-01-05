require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      user: "",
      product: "",
      quantidade: 1,
      numero_pedido: 1,
      preco: 1.5,
      endereco: ""
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[user]"

      assert_select "input[name=?]", "order[product]"

      assert_select "input[name=?]", "order[quantidade]"

      assert_select "input[name=?]", "order[numero_pedido]"

      assert_select "input[name=?]", "order[preco]"

      assert_select "input[name=?]", "order[endereco]"
    end
  end
end
