class AddDetailsToEffect < ActiveRecord::Migration
  def change
    add_column :effects, :hue, :float
    add_column :effects, :saturation, :float
    add_column :effects, :contrast, :float
    add_column :effects, :brightness, :float
  end
end
