class Post < ApplicationRecord
  belongs_to :user
  attachment :image

  enum genre_status: { ダイエット: 0, 筋トレ: 1, エクササイズ: 2, スポーツ: 3, 食事: 4, その他: 5 }

  # カテゴリによる絞り込み
  scope :get_by_genre_status, ->(genre_status) {
    where(genre_status: genre_status)
  }

end
