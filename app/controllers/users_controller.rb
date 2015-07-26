class UsersController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
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
 
  def followings # フォローしているユーザーを取得
    @user = User.find(params[:id])
    @follow_users = @user.following_users
  end

  def followers # フォローされているユーザーを取得
    @user = User.find(params[:id])
    @follow_users = @user.followed_users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :sex, :age, :country)
  end

 def follow_get # フォロー、フォロワーの数を検索
    @follower_num =  Relationship.where(follower_id: params[:id]).count
    @followed_num =  Relationship.where(followed_id: params[:id]).count
 end
end
