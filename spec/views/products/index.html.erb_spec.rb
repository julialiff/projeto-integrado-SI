require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        nome: "",
        category: "",
        descricao: "",
        quantidade: "",
        preco: "",
        comerciante: "",
        foto: "MyText"
      ),
      Product.create!(
        nome: "",
        category: "",
        descricao: "",
        quantidade: "",
        preco: "",
        comerciante: "",
        foto: "MyText"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
