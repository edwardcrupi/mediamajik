class AddAmountToEffects < ActiveRecord::Migration
  def change
    add_column :effects, :amount, :float
  end
end
