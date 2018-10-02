class ColorVariant < ApplicationRecord
	attr_accessor :color, :product_id
	belongs_to :product

end
