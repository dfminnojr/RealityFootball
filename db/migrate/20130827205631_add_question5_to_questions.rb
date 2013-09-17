class AddQuestion5ToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_5, :string
  end
end
