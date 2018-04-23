class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :authentication_tonken, :string, limit: 30
    add_index :users, :authentication_tonken, unique: true
  end
end
