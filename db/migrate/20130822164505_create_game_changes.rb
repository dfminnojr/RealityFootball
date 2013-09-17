class CreateGameChanges < ActiveRecord::Migration
  def change
    create_table :game_changes do |t|
      t.string :possession
      t.string :score
      t.integer :home_score
      t.integer :away_score
      t.timestamps
    end
  end
end
