class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :nome
      t.text :descricao
      t.integer :quantidade
      t.decimal :preco
      t.text :foto

      t.timestamps
    end

    add_reference :products, :category, null: false, foreign_key: true
    add_reference :products, :comerciante, null: false, foreign_key: true
  end
end
