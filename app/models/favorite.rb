class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :onsen

  scope :alphabet, -> { joins(:onsen).group("onsens.id").order("name ASC") }
  scope :rate_desc, -> { sort_by { |v| Onsen.find(v.onsen_id).reviews.average(:rate) ? Onsen.find(v.onsen_id).reviews.average(:rate) : 0.0 }.reverse }
  scope :rate_asc, -> { sort_by { |v| Onsen.find(v.onsen_id).reviews.average(:rate) ? Onsen.find(v.onsen_id).reviews.average(:rate) : 0.0 } }
end
