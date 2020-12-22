class CreateEnderecos < ActiveRecord::Migration[6.0]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :cep
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :complemento
      t.string :numero
      t.timestamps
    end

    add_reference :enderecos, :user, null: false, foreign_key: true
    remove_column :users, :endereco
  end
end
