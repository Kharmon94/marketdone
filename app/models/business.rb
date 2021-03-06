class Business < ApplicationRecord
	  belongs_to :user 
	  belongs_to :business_category
	  belongs_to :state

	 

  	# has_attached_file :image, styles: { medium: "300x300", thumb: "100x100", square: "200x200", large: "600x600", super: "1400x1400" }, default_url: "default.png"
    
   #  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    paginates_per 10
    validates :title, :description, :address, :city, :email, :hours, :number, :business_category, presence: true
    has_one_attached :artwork, dependent: :destroy
    has_many_attached :selections, dependent: :destroy
    validates :artwork, presence: true, blob: { content_type: :image }
    validates :selections, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif'], size_range: 1..5.megabytes }
    # validates_attachment_presence :image

  def self.search(find)
      if find
        where('title LIKE ? OR description LIKE ? OR address LIKE ? OR email LIKE ?', "%#{find}%", "%#{find}%", "%#{find}%", "%#{find}%").order('id DESC')
      else
        order('id DESC') 
      end
   end

  # def self.filter(filter)
  #   if filter
  #     where(business_category_id: filter)
  #   end
  # end

end
