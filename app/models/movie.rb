class Movie < ApplicationRecord
  validates :year, presence: true
  validates :title, presence: true
  validates :rating, presence: true
  validates :poster, presence: true
  validates :desc, presence: true

  has_many :comments

end
