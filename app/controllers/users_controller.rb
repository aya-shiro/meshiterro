class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 特定user(=@user)に関連付けられた全投稿(=.postimages)を
    # @postimagesに格納↓　アソしてるモデル同士だからできる記述
    @postimages = @user.postimages
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

end
