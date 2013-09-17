class AddTotalPointAmountToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :total_point_amount, :integer
  end
end
