class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :game_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
