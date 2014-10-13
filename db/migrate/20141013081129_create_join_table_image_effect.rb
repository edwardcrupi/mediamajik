class CreateJoinTableImageEffect < ActiveRecord::Migration
  def change
    create_join_table :images, :effects do |t|
      # t.index [:image_id, :effect_id]
      # t.index [:effect_id, :image_id]
    end
  end
end
