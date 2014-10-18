class AddInBinToImage < ActiveRecord::Migration
  def change
    add_column :images, :in_bin, :boolean
  end
end
