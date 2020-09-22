class CreateAdmModels < ActiveRecord::Migration[6.0]
  def change
    create_table :adm_models do |t|
      t.string :name
      t.string :email
      t.integer :num_identidade
      t.integer :senha
      t.integer :data_nasc
      t.string :endereco

      t.timestamps
    end
  end
end
