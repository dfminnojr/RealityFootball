class AddPointAmountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :point_amount, :integer
  end
end
