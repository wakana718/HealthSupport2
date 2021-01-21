class Record < ApplicationRecord
  belongs_to :user
  validates :weight, presence: true, numericality: true
end
