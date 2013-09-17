class UsersController < ApplicationController
  include SessionsHelper
  include UsersHelper


  def index
    if current_user.admin != true
      redirect_to '/'
    else
      respond_to do |format|
        format.json { render :json => User.all }
        format.html
        format.js {}
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      # UserMailer.welcome_email(@user).deliver
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Error"
      render :new
    end
  end

  def show
    # authenticate_user
    # if current_user.admin
    #   @user = User.find(params[:id])
    # else
      @user = current_user
    # end
    @bank = Bank.new(params[:bank])
    @bank.save
    @users = User.all
    # sorted_info = sort_users_by_points(@users)
    # @user_info = sorted_info.reverse
    @upcoming_games = Game.where(:home_score => nil, :away_score => nil)
    @wagers = @user.wagers
    @games = Game.all

    respond_to do |format|
        format.json { render :json => User.find(params[:id]) }
        format.html
        format.js {}
      end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    if @user.save(:validate => false)
      sign_in(@user)
      redirect_to user_path(@user.id)
    else
      flash[:error] = @user.errors.full_messages
      # binding.pry
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path
  end

  def games
    @user = User.find(params[:id])
  end

  def wagers
    @games = Game.all
    @user = User.find(params[:id])
  end

  def open_game
    game_register = current_user.participations.new
    game_register.game_id = params[:game]
    if game_register.save
      redirect_to game_path(params[:game])
    end
  end
end


