class Senshitu < ApplicationRecord
  has_many :onsens, through: :onsen_senshitus
  has_many :onsens, dependent: :destroy
end
