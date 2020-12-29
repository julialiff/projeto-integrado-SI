class AddFieldsToComerciantes < ActiveRecord::Migration[6.0]
  def change
    add_column :comerciantes, :nome, :string
    add_column :comerciantes, :documento, :string
  end
end
