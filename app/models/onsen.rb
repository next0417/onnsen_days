class Onsen < ApplicationRecord
  has_many :users, through: :favorites
  has_many :users, dependent: :destroy
  has_many :users, through: :visits
  has_many :users, dependent: :destroy
  has_many :users, through: :reviews
  has_many :users, dependent: :destroy
  has_many :kounous, through: :onsen_kounous
  has_many :kounous, dependent: :destroy
  has_many :senshitus, through: :onsen_senshitus
  has_many :senshitus, dependent: :destroy
end
