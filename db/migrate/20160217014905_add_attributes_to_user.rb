class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :image_url, :string
    add_column :users, :bio, :string
    add_column :users, :uid, :string
    add_column :users, :token, :string
  end
end
