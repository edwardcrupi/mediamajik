class AddDetailsToImage < ActiveRecord::Migration
  def change
    add_column :images, :owner, :string
    add_column :images, :size, :float
    add_column :images, :url, :string
  end
end
