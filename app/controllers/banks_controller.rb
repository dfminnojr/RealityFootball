class BanksController < ApplicationController
  include SessionsHelper

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(params[:bank])
  if @bank.save
    redirect_to(:back)
  end
end
end
