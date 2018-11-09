class ColorVariant < ApplicationRecord

	belongs_to :product

	validates :color, presence: true

end
