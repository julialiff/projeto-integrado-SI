require 'rails_helper'

RSpec.describe "carrinhos/edit", type: :view do
  before(:each) do
    @carrinho = assign(:carrinho, Carrinho.create!(
      user: "",
      product: "",
      quantidade: 1
    ))
  end

  it "renders the edit carrinho form" do
    render

    assert_select "form[action=?][method=?]", carrinho_path(@carrinho), "post" do

      assert_select "input[name=?]", "carrinho[user]"

      assert_select "input[name=?]", "carrinho[product]"

      assert_select "input[name=?]", "carrinho[quantidade]"
    end
  end
end
