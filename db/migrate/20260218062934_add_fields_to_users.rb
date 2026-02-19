class AddFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :role, :integer, null: false, default: 2
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :dob, :date
    add_column :users, :phone, :string
    add_column :users, :address, :text
  end
end
