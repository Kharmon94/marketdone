class Order < ApplicationRecord
	validates :address, :city, :state, :zip, :quantity, presence: true
	belongs_to :product
	belongs_to :buyer, class_name: "User"
  	belongs_to :seller, class_name: "User"

  	paginates_per 20

	def self.nonshipped
	  where(shipped: false).order('id DESC')
	end

	def self.shipped
	  where(shipped: true).order('id DESC')
	end  
end
