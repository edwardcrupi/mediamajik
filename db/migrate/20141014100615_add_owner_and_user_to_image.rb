class AddOwnerAndUserToImage < ActiveRecord::Migration
  def change
    add_column :images, :owner_id, :integer
    add_column :images, :user_id, :integer
  end
end
