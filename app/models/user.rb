class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :onsens, through: :favorites
  has_many :onsens, dependent: :destroy
  has_many :onsens, through: :visits
  has_many :onsens, dependent: :destroy
  has_many :onsens, through: :reviews
  has_many :onsens, dependent: :destroy
end
