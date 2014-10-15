class ChangeTypeFromStringToIntegerInEffect < ActiveRecord::Migration
  def change
    rename_column :effects, :type, :effect_type
  end
end
