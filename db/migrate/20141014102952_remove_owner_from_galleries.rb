class RemoveOwnerFromGalleries < ActiveRecord::Migration
  def change
    remove_column :galleries, :owner, :string
  end
end
