class AddGameIdToWagers < ActiveRecord::Migration
  def change
    add_column :wagers, :game_id, :integer
  end
end
