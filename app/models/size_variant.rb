class SizeVariant < ApplicationRecord
	attr_accessor :size, :product_id
	belongs_to :product
end
