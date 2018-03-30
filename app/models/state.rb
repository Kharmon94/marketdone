class State < ApplicationRecord
	has_many :businesses
	has_many :business_categories, through: :businesses
  
end
