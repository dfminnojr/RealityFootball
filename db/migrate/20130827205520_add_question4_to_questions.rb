class AddQuestion4ToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_4, :string
  end
end
