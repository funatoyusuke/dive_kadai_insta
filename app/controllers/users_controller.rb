class UsersController < ApplicationController
  before_action :set_user , only:[:favo]

  def show
  end
  
  def favo
    @favo_pictures = @user.favo_pictures
  end
  
  private
  def set_user
    @user = User.find_by(id: params[:id])
  end
  
end
