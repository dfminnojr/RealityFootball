class Participation < ActiveRecord::Base
  attr_accessible :game, :user

  belongs_to :user
  belongs_to :game
  accepts_nested_attributes_for :game
  accepts_nested_attributes_for :user
end
