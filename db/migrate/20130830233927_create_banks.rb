class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.integer :balance
      t.integer :user_id
      t.timestamps
    end
  end
end
