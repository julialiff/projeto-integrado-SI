class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :name
      t.string :tipo
      t.text :descricao
      t.integer :quantidade
      t.decimal :price, precision: 10, scale: 2
      t.text :foto

      t.timestamps
    end
  end
end
