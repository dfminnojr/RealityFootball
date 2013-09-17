class Wager < ActiveRecord::Base
  attr_accessible :point_amount, :status, :result, :user_id, :game_id, :question_id, :response

  belongs_to :game
  belongs_to :question
  belongs_to :user

  before_create validates_presence_of :point_amount, :response

end
