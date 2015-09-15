class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find params[:id]
    @microposts = current_user.microposts.page params[:page]
  end

  def new
  end
end
