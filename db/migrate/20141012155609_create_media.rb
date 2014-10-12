class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :owner
      t.float :size
      t.string :type
      t.string :url

      t.timestamps
    end
  end
end
