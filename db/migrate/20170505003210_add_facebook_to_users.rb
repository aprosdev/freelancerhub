class AddFacebookToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :instagram, :string
    add_column :users, :description, :string
  end
end
