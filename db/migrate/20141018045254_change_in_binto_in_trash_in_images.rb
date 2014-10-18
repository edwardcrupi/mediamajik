class ChangeInBintoInTrashInImages < ActiveRecord::Migration
  def change
	rename_column :images, :in_bin, :in_trash
  end
end
