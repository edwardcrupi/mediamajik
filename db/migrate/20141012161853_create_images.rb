class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.float :length
      t.float :width
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
