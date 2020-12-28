require 'rails_helper'

RSpec.describe User do
    it "Cria um usuário" do
        users_qtt = User.all.length()
        user = User.new(
            is_admin: false,
            nome: "Fulano", 
            email: "fulano@example.com",
            documento: "12345678910", 
            data_nascimento: Date.today(), 
            endereco: "Rua etc de tal, 123"
        )
        users_qtt_new = User.all.length()

        
        users_qtt_new.equal? (1+users_qtt)
        User.where("email = 'fulano@example.com'").first.equal? user
    end

    it "Edita um usuário" do
        user = User.new(
            is_admin: false,
            nome: "Fulano", 
            email: "fulano@example.com",
            documento: "12345678910", 
            data_nascimento: Date.today(), 
            endereco: "Rua etc de tal, 123"
        )

        user_before = user

        user.update(
            nome: "Fulano da Silva",
            email: "fulano_alt@example.com",
            documento: "12345678910", 
            data_nascimento: Date.yesterday(), 
            endereco: "Rua etc de tal, 1234"
        )
        
        !(user.equal? user_before)
        !(user.nome.equal? user_before.nome)
        !(user.email.equal? user_before.email)
        user.documento.equal? user_before.documento
        !(user.data_nascimento.equal? user_before.data_nascimento)
    end
end