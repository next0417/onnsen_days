class Onsen < ApplicationRecord

  has_many_attached :images

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, dependent: :destroy

  has_many :visits, dependent: :destroy
  has_many :users, through: :visits, dependent: :destroy

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews, dependent: :destroy

  has_many :onsen_kounous, dependent: :destroy
  has_many :kounous, through: :onsen_kounous, dependent: :destroy

  has_many :onsen_senshitus, dependent: :destroy
  has_many :senshitus, through: :onsen_senshitus, dependent: :destroy

  enum is_active: { 営業中: 0, 休業中: 1, 閉店: 2 }

  validate :images_length

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def images_length
    if images.length > 4 || images.length == 0
      images.select {|image| image.id == nil}.each(&:purge)
      errors.add(:images, "は1~4枚以内にしてください")
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def visited_by?(user)
    visits.exists?(user_id: user.id)
  end
end
