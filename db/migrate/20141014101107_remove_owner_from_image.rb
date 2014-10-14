class RemoveOwnerFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :owner_id, :integer
  end
end
