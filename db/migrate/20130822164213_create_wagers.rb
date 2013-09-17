class CreateWagers < ActiveRecord::Migration
  def change
    create_table :wagers do |t|
      t.integer :point_amount
      t.string :result
      t.integer :user_id
      t.integer :question_id
      t.string :response
      t.timestamps
    end
  end
end
