class Review < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  after_validation do
    #byebug
    if self.errors.keys.include?(:review)
      self.self.errors.delete(:rate)
      self.errors.add(:rate, "がありません")
    end
  end

  belongs_to :user
  belongs_to :onsen

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
