class SessionsController < ApplicationController
  before_filter :user_finder, :only => [:create]
  include SessionsHelper

  def new 
  end

  def create
    @user = user_finder
    if @user
      sign_in(@user)
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Error"
      render :new
    end
  end

  def destroy
    self.current_user = nil
    cookies.delete(:remember_token)
    redirect_to signin_path
  end
end

