class Product < ApplicationRecord
  belongs_to :user 
  belongs_to :category 
  has_many :orders 
  has_many :reviews
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :color_variants
  has_many :size_variants
  accepts_nested_attributes_for :color_variants, :reject_if => :all_blank, allow_destroy: true
  accepts_nested_attributes_for :size_variants, :reject_if => :all_blank, allow_destroy: true
  attr_accessor :color_variant_attributes, :size_variant_attributes

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x80", square: "200x200", large: "600x600" }, default_url: "default.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  # validates_attachment_presence :image
  validates_numericality_of :price, greater_than_or_equal_to: 0
  validates :title, :description, :price, :shipping_cost, presence: true
  paginates_per 20
  
  def self.search(search)
    if search
      where('title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%" ).order('id DESC')
    else
      order('id DESC') 
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).products
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end




  def seller
    return User.find(self.user_id)
  end
end
