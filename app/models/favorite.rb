class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :onsen

  scope :alphabet, -> { joins(:onsen).group("onsens.id").order("name ASC") }
  scope :rate_desc, -> { joins(:reviews).group("onsens.id").order("AVG(reviews.rate) DESC") }
  scope :rate_asc, -> { joins(:reviews).group("onsens.id").order("AVG(reviews.rate) ASC") }
end
