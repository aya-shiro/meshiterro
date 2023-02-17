class PostimagesController < ApplicationController
  def new
    @postimage = Postimage.new
  end

  def create
    @postimage = Postimage.new(postimage_params)
    @postimage.user_id = current_user.id
    if @postimage.save
      redirect_to postimages_path
    else
      render :new
    end
  end

  def index
    # @postimages = Postimage.allを下記に書換
    @postimages = Postimage.page(params[:page])
  end

  def show
    @postimage = Postimage.find(params[:id])
    # PostCommentモデル、アソしてるから使えるっぽい
    @post_comment = PostComment.new
  end


  def destroy
    postimage.find(params[:id])
    postimage.destroy
    redirect_to postimages_path
  end


  private
  def postimage_params
    params.require(:postimage).permit(:shop_name, :image, :caption)
  end

end
