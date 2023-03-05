class Senshitu < ApplicationRecord

  validates :senshitu_name, presence: true

  has_many :onsen_senshitus, dependent: :destroy
  has_many :onsens, through: :onsen_senshitus, dependent: :destroy

end
