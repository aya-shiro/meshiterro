class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    # 特定user(=@user)に関連付いた全投稿(.postimages)を@postimagesに格納
    # １.postimagesはテーブル名
    @postimages = @user.postimages.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless urer_id == current_user.id
      redirect_to postimage_path
    end
  end

end
