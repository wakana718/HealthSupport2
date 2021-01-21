class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  enum genre_status: { ダイエット: 0, 筋トレ: 1, エクササイズ: 2, スポーツ: 3, 食事: 4, その他: 5 }
  validates :body, presence: true, length: { maximum: 150 }

  # カテゴリによる絞り込み
  scope :get_by_genre_status, ->(genre_status) {
    where(genre_status: genre_status)
  }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # いいねの重複防止
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, dependent: :destroy

  # お気に入りの重複防止
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :tags, dependent: :destroy

end
