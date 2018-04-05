class Profile < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :avatar
  validates :username, :first_name, :last_name, :street_address, :city, :zipcode, presence: true
end
