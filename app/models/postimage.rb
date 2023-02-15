class Postimage < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  #19行目の引数は「なんらかしらのユーザーが入るよ」という設定みたいなもの
  # ビューではcurrent_userが入ってる
  def favorited_by?(user)
    # 21行目の引数もモデルテーブルカラム変数関係ない、設定みたいなものらしい…
    favorites.exists?(user_id: user.id)
  end


end


