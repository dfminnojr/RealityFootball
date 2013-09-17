class GamesController < ApplicationController
  before_filter :authenticate_user, :only => [:show]
  include SessionsHelper
  include GamesHelper
  include UsersHelper

  def index
    @games = Game.all
    respond_to do |format|
        format.json { render :json => Game.all }
        format.html

      end

  end

  def show
    @user = current_user
    @game = Game.find(params[:id])
    create_pregame_questions
    @wager_1 = @q1.wagers.build(params[:wager])
    @wager_2 = @q2.wagers.build(params[:wager])
    @wager_3 = @q3.wagers.build(params[:wager])
    @wager_4 = @q4.wagers.build(params[:wager])
    @wager_5 = @q5.wagers.build(params[:wager])
    @wager_6 = @q6.wagers.build(params[:wager])
    @wager_7 = @q7.wagers.build(params[:wager])
    @game_wager_1 = @q8.wagers.build(params[:wager])
    @game_wager_2 = @q9.wagers.build(params[:wager])
    @game_wager_3 = @q10.wagers.build(params[:wager])
    @game_wager_4 = @q11.wagers.build(params[:wager])
    respond_to do |format|
        format.json { render :json => Game.find(params[:id]) }
        format.html
        format.js {}
      end
  end




end
