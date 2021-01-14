require 'rails_helper'

#RSpec.describe Product, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

require 'rails_helper'

RSpec.describe Product do
    it "Cria um produto" do
        products_qtt = Product.all.length()

        product = Product.new(
            nome: "Mascara 1",
            descricao: "lorem ipsum etc etc",
            quantidade: 20,
            preco: 45.to_d,
            category_id: 1,
            comerciante_id: 1,
            foto: nil
        )
        products_qtt_new = Product.all.length()

        
        products_qtt_new.equal? (1+products_qtt)
        Product.where("nome = 'Mascara 1'").first.equal? product
    end

    it "Edita um produto" do
        product = Product.new(
            nome: "Mascara 1",
            descricao: "lorem ipsum etc etc",
            quantidade: 20,
            preco: 45.to_d,
            category_id: 1,
            comerciante_id: 1,
            foto: nil
        )

        product_before = product

        product.update(
            nome: "Nova Mascara 1",
            descricao: "nova lorem ipsum etc etc",
            quantidade: 10,
            preco: 45.to_d
        )
        
        !(product.equal? product_before)
        !(product.nome.equal? product_before.nome)
        !(product.descricao.equal? product_before.descricao)
        product.preco.equal? product_before.preco
        !(product.quantidade.equal? product_before.quantidade)
    end
end
