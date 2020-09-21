class CreateVendedorModels < ActiveRecord::Migration[6.0]
  def change
    create_table :vendedor_models do |t|
      t.string :name
      t.string :email
      t.integer :num_identidade
      t.integer :senha
      t.integer :data_nasc
      t.string :endereco
      t.string :razao_social
      t.string :nome_fantasia
      t.string :endereco_parceiro

      t.timestamps
    end
  end
end
