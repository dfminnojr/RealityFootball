class WagersController < ApplicationController
  include SessionsHelper

  def create
    @wager = Wager.create(params[:wager])
    @game = Game.find_by_id(params[:game_id])
    respond_to do |format|
      if @wager.save
        current_user.bank.balance = current_user.bank.balance - @wager.point_amount
        current_user.bank.save

        # format.html { redirect_to(:back) }
        format.js {}
      end
    end
  end
end
