class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string  :home_team
      t.string  :away_team
      t.string  :start_time
      t.string  :game_date
      t.string  :score
      t.string  :winner
      t.timestamps
    end
  end
end
