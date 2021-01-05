class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :quantidade
      t.integer :numero_pedido
      t.decimal :preco

      t.timestamps
    end

    add_reference :orders, :user, null: false, foreign_key: true
    add_reference :orders, :product, null: false, foreign_key: true
    add_reference :orders, :endereco, null: false, foreign_key: true
  end
end
