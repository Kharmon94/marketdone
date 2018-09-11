class ColorVariant < ApplicationRecord
	attr_accessor :color, :product_id, :size_variant_attributes
	belongs_to :product
	has_many :size_variants
	accepts_nested_attributes_for :size_variants, :reject_if => lambda { |attribute| attribute[:size].blank? }, allow_destroy: true
	

end
