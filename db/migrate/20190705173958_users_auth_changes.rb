class UsersAuthChanges < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :email, :string, default: "dummy@dummy.com"
  	change_column_default :users, :provider, from: "username", to: "email"
  end
end
