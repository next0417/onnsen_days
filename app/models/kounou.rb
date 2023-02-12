class Kounou < ApplicationRecord
  has_many :onsens, through: :onsen_kounous
  has_many :onsens, dependent: :destroy
end
