class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users, :id => false do |t|
      t.integer :group_id
      t.integer :user_id
    end
  end
end
