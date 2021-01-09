class AddTelefoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :telefone, :string
  end
end
