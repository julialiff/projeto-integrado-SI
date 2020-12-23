class AddDefaultNomeToEnderecos < ActiveRecord::Migration[6.0]
  def change
    add_column :enderecos, :default, :boolean
    add_column :enderecos, :nome, :string
  end
end
