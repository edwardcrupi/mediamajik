class AddMediaIdToMedia < ActiveRecord::Migration
  def change
    add_column :media, :media_id, :integer
  end
end
