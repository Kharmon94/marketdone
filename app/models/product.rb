class Product < ApplicationRecord
  belongs_to :user 
  belongs_to :category 
  has_many :orders 
  has_many :reviews
  has_many :votes, dependent: :destroy
  has_many :color_variants
  has_many :size_variants
  accepts_nested_attributes_for :color_variants, :reject_if => :all_blank, allow_destroy: true
  accepts_nested_attributes_for :size_variants, :reject_if => :all_blank, allow_destroy: true
  # has_attached_file :image, styles: { medium: "300x300", thumb: "100x80", square: "200x200", large: "600x600" }, default_url: "default.png"
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  # validates_attachment_presence :image
  has_one_attached :picture
  has_many_attached :images
  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates :title, :description, :price, :shipping_cost, :inventory, :condition, presence: true
  paginates_per 20
  
  
  def self.search(search)
    if search
      where('title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%" ).order('id DESC')
    else
      order('id DESC') 
    end
  end



  def seller
    return User.find(self.user_id)
  end
end
