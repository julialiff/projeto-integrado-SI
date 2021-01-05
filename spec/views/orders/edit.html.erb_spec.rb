require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      user: "",
      product: "",
      quantidade: 1,
      numero_pedido: 1,
      preco: 1.5,
      endereco: ""
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[user]"

      assert_select "input[name=?]", "order[product]"

      assert_select "input[name=?]", "order[quantidade]"

      assert_select "input[name=?]", "order[numero_pedido]"

      assert_select "input[name=?]", "order[preco]"

      assert_select "input[name=?]", "order[endereco]"
    end
  end
end
