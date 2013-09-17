class AddOptionsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_1, :string
    add_column :questions, :question_2, :string
    add_column :questions, :question_3, :string
    add_column :questions, :correct_answer, :string
  end
end
