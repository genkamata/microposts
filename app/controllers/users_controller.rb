class UsersController < ApplicationController
  
  def show # 追加
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcom to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

   def edit
    @user = User.find(params[:id])
   end
  
   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:success] = "Profile updated"
       redirect_to @user
    else
       render 'edit'
    end
   end
 
  def followings # フォローしているユーザ取得
    @user = User.find(params[:id])
    @following_users = @user.following_users
  end

  def followers # フォローされているユーザ取得
    @user = User.find(params[:id])
    @followed_users = @user.followed_users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :sex, :age, :country, :avatar)
  end
end
