require 'rails_helper'

RSpec.describe Category, type: :model do
  it "Cria uma categoria" do

	category_qtt = Category.all.length()
  	category = Category.create nome: "Mascara tipo1"

	category_qtt_new = Category.all.length()

	category_qtt_new.equal? (1+category_qtt)
    Category.where("nome = 'Mascara tipo1'").first.equal? category

  end

  it "Edita uma categoria" do
    
    category = Category.create nome: "Mascara tipo2"
    
    category_before = category

	category.update(
            nome: "Nova Mascara 3"
        )

	!(category.equal? category_before)
    !(category.nome.equal? category_before.nome)
	
  end
end
