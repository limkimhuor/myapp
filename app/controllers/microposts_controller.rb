class MicropostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @micropost = current_user.microposts.new
  end

  def create
    @micropost = current_user.microposts.build micropost_params
    if @micropost.save
      flash[:notice] = flash_message "created"
      redirect_to current_user
    else
      flash[:altert] = flash_message "not_created"
      render :new
    end

  end

  private
  def micropost_params
    params.require(:micropost).permit :content
  end
end
