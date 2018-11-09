class SizeVariant < ApplicationRecord

	belongs_to :product

	validates :size, presence: true

end
