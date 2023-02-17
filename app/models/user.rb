class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :favorites, dependent: :destroy
  has_many :onsens, through: :favorites, dependent: :destroy

  has_many :visits, dependent: :destroy
  has_many :onsens, through: :visits, dependent: :destroy

  has_many :reviews, dependent: :destroy
  has_many :onsens, through: :reviews, dependent: :destroy
end
