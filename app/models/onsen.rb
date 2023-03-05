class Onsen < ApplicationRecord

  has_many_attached :images

  validates :name, presence: true
  validates :introduction, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  after_validation do
    if self.errors.keys.include?(:address)
      self.errors.delete(:latitude)
      self.errors.delete(:longitude)
      self.errors.delete(:address)
      self.errors.add(:address, "がありません")
    end
  end

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

  enum is_active: { onsen_open: 0, rest: 1, closed: 2 }

  scope :alphabet, -> { order("name ASC") }
  scope :rate_desc, -> { left_joins(:reviews).group("onsens.id").order("AVG(reviews.rate) DESC") }
  scope :rate_asc, -> { left_joins(:reviews).group("onsens.id").order("AVG(reviews.rate) ASC") }

  def review_average
    self.reviews.average(:rate)
  end

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def validate_images_length_new(image_counts)
    if images.length > 4 || images.length == 0
      errors.add(:images, "は1~4枚以内にしてください")
    end
  end

  def validate_images_length(delete_image_counts)
    if delete_image_counts.nil?
      delete_image_counts = 0
    end
    if images.length - delete_image_counts > 4 || images.length - delete_image_counts == 0
      images.select {|image| image.id == nil}.each(&:purge)
      errors.add(:images, "は1~4枚以内にしてください")
    return false
    end
    true
  end

  def self.search(keyword,senshitu_ids,kounou_ids,sort)
    onsen = Onsen
    if keyword.present?
      onsen = onsen.where('name LIKE(?)', "%#{keyword}%")
              .or(where('address LIKE(?)', "%#{keyword}%"))
    end
    pp onsen

    if sort == "0"
      onsen = onsen.order("name")
    elsif sort == "1"
      onsen = onsen.left_joins(:reviews).group("onsens.id").order("AVG(reviews.rate) DESC")
    else
      onsen = onsen.left_joins(:reviews).group("onsens.id").order("AVG(reviews.rate)")
    end

    if kounou_ids
      onsen = onsen.joins(:kounous).where(kounous: { id: kounou_ids}).where(id: onsen.pluck(:id))
      pp onsen
    end
    if senshitu_ids
      onsen = onsen.joins(:senshitus).where(senshitus: { id: senshitu_ids}).where(id: onsen.pluck(:id))
      pp onsen
    end
    return onsen
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def visited_by?(user)
    visits.exists?(user_id: user.id)
  end
end
