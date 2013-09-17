class Bank < ActiveRecord::Base
  attr_accessible :balance, :total_point_amount, :rank, :user_id

  belongs_to :user
end
