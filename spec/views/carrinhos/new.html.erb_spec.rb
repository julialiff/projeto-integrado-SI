require 'rails_helper'

RSpec.describe "carrinhos/new", type: :view do
  before(:each) do
    assign(:carrinho, Carrinho.new(
      user: "",
      product: "",
      quantidade: 1
    ))
  end

  it "renders new carrinho form" do
    render

    assert_select "form[action=?][method=?]", carrinhos_path, "post" do

      assert_select "input[name=?]", "carrinho[user]"

      assert_select "input[name=?]", "carrinho[product]"

      assert_select "input[name=?]", "carrinho[quantidade]"
    end
  end
end
