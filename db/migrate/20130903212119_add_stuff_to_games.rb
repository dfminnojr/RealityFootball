class AddStuffToGames < ActiveRecord::Migration
  def change
    add_column :games, :venue_info, :text
    add_column :games, :home_qb_stat, :integer
    add_column :games, :away_qb_stat, :integer
    add_column :games, :home_rb_stat, :integer
    add_column :games, :away_rb_stat, :integer
  end
end
