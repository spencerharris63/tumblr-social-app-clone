class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      redirect_to root_url, notice: "Welcome to the site!"
    else 
      render "new"
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    redirect_back(fallback_location: root_path)
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
