class Review < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  belongs_to :onsen

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
