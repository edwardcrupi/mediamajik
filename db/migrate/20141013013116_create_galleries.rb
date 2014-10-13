class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :owner
      t.integer :number_of_images

      t.timestamps
    end
  end
end
