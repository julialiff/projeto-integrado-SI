require 'rails_helper'

RSpec.describe "enderecos/show", type: :view do
  before(:each) do
    @endereco = assign(:endereco, Endereco.create!(
      logradouro: "Logradouro",
      cep: "Cep",
      bairro: "Bairro",
      cidade: "Cidade",
      estado: "Estado",
      complemento: "Complemento",
      numero: "Numero"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Logradouro/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Bairro/)
    expect(rendered).to match(/Cidade/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/Complemento/)
    expect(rendered).to match(/Numero/)
  end
end
