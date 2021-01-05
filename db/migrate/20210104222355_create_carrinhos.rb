class CreateCarrinhos < ActiveRecord::Migration[6.0]
  def change
    create_table :carrinhos do |t|
      t.integer :quantidade

      t.timestamps
    end

    add_reference :carrinhos, :user, null: false, foreign_key: true
    add_reference :carrinhos, :product, null: false, foreign_key: true
  end
end
