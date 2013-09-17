class Game < ActiveRecord::Base
  attr_accessible :home_team, :away_team, :score, :winner, :start_time, :game_date, :home_score, :away_score, :week, :venue_info, :home_qb_stat, :away_qb_stat, :home_rb_stat, :away_rb_stat

  has_many :participations
  has_many :users, :through => :participations
  has_many :questions
  has_many :wagers



end
