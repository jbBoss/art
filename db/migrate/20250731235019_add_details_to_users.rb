class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :province_id, :integer
    add_column :users, :is_admin, :boolean
    add_foreign_key :users, :provinces
  end
end
