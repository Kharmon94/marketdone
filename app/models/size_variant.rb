class SizeVariant < ApplicationRecord
	belongs_to :color_variant, optional: true
end
