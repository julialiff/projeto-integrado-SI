class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :is_admin
      t.string :nome
      t.string :documento
      t.date :data_nascimento
      t.string :endereco

      t.timestamps
    end
  end
end
