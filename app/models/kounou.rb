class Kounou < ApplicationRecord
  has_many :onsen_kounous, dependent: :destroy
  has_many :onsens, through: :onsen_kounous, dependent: :destroy
end
