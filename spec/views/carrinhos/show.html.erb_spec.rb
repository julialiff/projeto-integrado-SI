require 'rails_helper'

RSpec.describe "carrinhos/show", type: :view do
  before(:each) do
    @carrinho = assign(:carrinho, Carrinho.create!(
      user: "",
      product: "",
      quantidade: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
