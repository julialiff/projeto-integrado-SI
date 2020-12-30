require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      nome: "",
      category: "",
      descricao: "",
      quantidade: "",
      preco: "",
      comerciante: "",
      foto: "MyText"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[nome]"

      assert_select "input[name=?]", "product[category]"

      assert_select "input[name=?]", "product[descricao]"

      assert_select "input[name=?]", "product[quantidade]"

      assert_select "input[name=?]", "product[preco]"

      assert_select "input[name=?]", "product[comerciante]"

      assert_select "textarea[name=?]", "product[foto]"
    end
  end
end
