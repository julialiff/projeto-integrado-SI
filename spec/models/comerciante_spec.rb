require 'rails_helper'

RSpec.describe Comerciante, type: :model do

  it "Cria uma comerciante" do
    comerciante_qtt = Comerciante.all.length()
	comerciante = Comerciante.create(
		nome: "dick vigarista",
		email: "dickvigarista@gmail.com",
		documento: "seila"
		
	)

	comerciante_qtt_new = Comerciante.all.length()

	comerciante_qtt_new.equal? (1+comerciante_qtt)

  end

  it "Edita uma comerciante" do
	
    comerciante = Comerciante.create nome: "Mascara tipo2"
    
    comerciante_before = comerciante

	comerciante.update(
            nome: "dick vigarista 2",
			email: "dickvigarista2@gmail.com",
			documento: "seila2"
        )

	!(comerciante.equal? comerciante_before)
    !(comerciante.nome.equal? comerciante_before.nome)


  end

end
