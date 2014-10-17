class AddVersionToImage < ActiveRecord::Migration
  def change
    add_column :images, :v, :integer
  end
end
