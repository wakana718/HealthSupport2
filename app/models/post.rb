class Post < ApplicationRecord
  belongs_to :user
  attachment :image

  enum genre_status: { ダイエット: 0, 筋トレ: 1, エクササイズ: 2, スポーツ: 3, 食事: 4, その他: 5 }

  # カテゴリによる絞り込み
  scope :get_by_genre_status, ->(genre_status) {
    where(genre_status: genre_status)
  }

 has_many :comments, dependent: :destroy
 has_many :likes, dependent: :destroy

 def liked_by?(user)
    likes.where(user_id: user.id).exists?
 end

end
