class BusinessCategory < ApplicationRecord
	has_many :businesses
	has_many :states, through: :businesses
  
end
