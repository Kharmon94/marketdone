class Product < ApplicationRecord
  belongs_to :user 
  belongs_to :category 
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :color_variants, dependent: :destroy
  has_many :size_variants, dependent: :destroy
  accepts_nested_attributes_for :color_variants, :reject_if => :all_blank, allow_destroy: true
  accepts_nested_attributes_for :size_variants, :reject_if => :all_blank, allow_destroy: true
  # has_attached_file :image, styles: { medium: "300x300", thumb: "100x80", square: "200x200", large: "600x600" }, default_url: "default.png"
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  # validates_attachment_presence :image
  has_one_attached :picture, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  validates :picture, presence: true, blob: { content_type: :image }
  validates :images, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif'], size_range: 1..5.megabytes }

  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates :title, :description, :price, :shipping_cost, :condition, presence: true
  
  paginates_per 20
  
  
  def self.search(search)
    if search
      where('title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%" ).order('RANDOM()')
    else
      order('RANDOM()') 
    end
  end



  def seller
    return User.find(self.user_id)
  end
end
