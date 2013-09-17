class Question < ActiveRecord::Base
  attr_accessible :title, :game_id, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :correct_answer

  belongs_to :game
  has_many :wagers

end
