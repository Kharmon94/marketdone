class SizeVariant < ApplicationRecord
	attr_accessor :size, :quantity, :color_variant_id
	belongs_to :color_variant
end
