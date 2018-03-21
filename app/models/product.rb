class Product < ApplicationRecord
  has_many :charges
  belongs_to :user  
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100", square: "200x200", large: "600x600" }, default_url: "default.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

 
  def self.search(search)
    if search
      where('title LIKE ? OR description LIKE ? OR tag LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" ).order('id DESC')
    else
      order('id DESC') 
    end
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).post
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end

  def seller
    return User.find(self.user_id)
  end
end
