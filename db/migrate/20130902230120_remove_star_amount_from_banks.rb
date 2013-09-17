class RemoveStarAmountFromBanks < ActiveRecord::Migration
  def up
  end

  def down
    remove_column :banks, :star_amount
  end
end
