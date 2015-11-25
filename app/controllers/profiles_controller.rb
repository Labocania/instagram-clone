class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :owned_profile, only: [:edit, :update]
  
  def show
    @posts = User.find_by(user_name: params[:user_name]).posts.order('created_at DESC')
  end
  
  def edit
    
  end
  
  def update
    if @user.update(profile_params)
      flash[:success] = "Profile updated."
      redirect_to profile_path(@user.user_name)
    else
      @user.errors.full_messages
      flash.now[:alert] = "Profile not updated."
      render :edit
    end
  end
  
  private
    def profile_params
      params.require(:user).permit(:avatar, :bio)
    end
    
    def set_user
      @user = User.find_by(user_name: params[:user_name])
    end
    
    def owned_profile
      unless current_user == @user
        flash[:alert] = "That profile doesn't belong to you!"
        redirect_to root_path
      end
    end
end