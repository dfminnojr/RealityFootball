class AddQuestion6ToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_6, :string
  end
end
