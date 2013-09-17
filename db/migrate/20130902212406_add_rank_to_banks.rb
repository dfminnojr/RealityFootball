class AddRankToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :rank, :string
  end
end
