require 'rails_helper'

RSpec.describe "enderecos/index", type: :view do
  before(:each) do
    assign(:enderecos, [
      Endereco.create!(
        logradouro: "Logradouro",
        cep: "Cep",
        bairro: "Bairro",
        cidade: "Cidade",
        estado: "Estado",
        complemento: "Complemento",
        numero: "Numero"
      ),
      Endereco.create!(
        logradouro: "Logradouro",
        cep: "Cep",
        bairro: "Bairro",
        cidade: "Cidade",
        estado: "Estado",
        complemento: "Complemento",
        numero: "Numero"
      )
    ])
  end

  it "renders a list of enderecos" do
    render
    assert_select "tr>td", text: "Logradouro".to_s, count: 2
    assert_select "tr>td", text: "Cep".to_s, count: 2
    assert_select "tr>td", text: "Bairro".to_s, count: 2
    assert_select "tr>td", text: "Cidade".to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: "Complemento".to_s, count: 2
    assert_select "tr>td", text: "Numero".to_s, count: 2
  end
end
