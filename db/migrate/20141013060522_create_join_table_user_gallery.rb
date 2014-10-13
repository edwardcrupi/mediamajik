class CreateJoinTableUserGallery < ActiveRecord::Migration
  def change
    create_join_table :users, :galleries do |t|
      # t.index [:user_id, :gallery_id]
      # t.index [:gallery_id, :user_id]
    end
  end
end
