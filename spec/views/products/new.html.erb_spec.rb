require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      nome: "",
      category: "",
      descricao: "",
      quantidade: "",
      price: "",
      comerciante: "",
      foto: "MyText"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[nome]"

      assert_select "input[name=?]", "product[category]"

      assert_select "input[name=?]", "product[descricao]"

      assert_select "input[name=?]", "product[quantidade]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[comerciante]"

      assert_select "textarea[name=?]", "product[foto]"
    end
  end
end
