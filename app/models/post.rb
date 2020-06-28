class Post < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :food, presence: true, length: { maximum: 20 }
  validates :protein, presence: true

end
