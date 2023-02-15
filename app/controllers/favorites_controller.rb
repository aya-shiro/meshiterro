class FavoritesController < ApplicationController

  def create
    # 引数:postimage_idはFavoriteモデルの外部キー、Postimageモデルのidカラムと繋がっているから.findで取得できる！
    postimage = Postimage.find(params[:postimage_id])
    # 9行目はfavorite = Favorite.new(postimage_id: postimage.id)とfavorites.user_id = current_user.idを一文にまとめた記述
    # 4行目コメントアウトの考えを引数内で形にしている、引数内の：は＝と同義
    # (Favoriteモデルのカラムpostimage_idを: Postimageモデルのカラムpostimage.idとする)
    favorite = current_user.favorites.new(postimage_id: postimage.id)
    favorite.save
    redirect_to postimage_path(postimage)
  end

  def destroy
    postimage = Postimage.find(params[:postimage_id])
    favorite = current_user.favorites.find_by(postimage_id: postimage.id)
    favorite.destroy
    redirect_to postimage_path(postimage)
  end

end
