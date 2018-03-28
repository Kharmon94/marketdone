class Business < ApplicationRecord
	  belongs_to :user 
	  belongs_to :business_category
  	has_attached_file :image, styles: { medium: "300x300", thumb: "100x100", square: "200x200", large: "600x600" }, default_url: "default.png"
    
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :business_category, presence: true




# def self.search(search)
#     if search
#       where('title LIKE ? OR description LIKE ? OR address LIKE ? OR email LIKE ? OR state LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%",).order('id DESC')
#     else
#       order('id DESC') 
#     end
#  end

end
