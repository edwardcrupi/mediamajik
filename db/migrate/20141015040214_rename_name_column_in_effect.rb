class RenameNameColumnInEffect < ActiveRecord::Migration
  def change
    rename_column :effects, :name, :type
  end
end
