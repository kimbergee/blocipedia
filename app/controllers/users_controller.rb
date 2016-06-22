class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def downgrade
    flash[:notice] = "Boo, you are no longer a premium user #{current_user.username}! Don't forget that you can always upgrade again."
    redirect_to user_path(current_user)
    current_user.standard!
  end

end
