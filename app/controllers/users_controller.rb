class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
 
  def followings
    @user  = User.find(params[:id])
    @users = @user.following_users.order(created_at: :desc).page(params[:page]).per(5)
    @title = "Followings"
  end
  
  def followers
    @user  = User.find(params[:id])
    @users = @user.follower_users.order(created_at: :desc).page(params[:page]).per(5)
    @title = "Followers"
  end
  
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(5)
    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit 
  end
  
  def update
     if  @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
      #  更新に成功した時の処理 
     else
        render  'edit'
     end
  end
  
  private


  def user_params
      params.require(:user).permit(:name, :email, :password, :profile,
                                 :password_confirmation)
  end
  
  
       # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url)unless @user == current_user
  end
  
  
end
