class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :games_users, :group_id, :game_id
  end
end
