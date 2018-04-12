class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  acts_as_messageable

  # has_one :profile
  has_many :products
  has_many :businesses
  has_many :charges
  has_many :reviews
  # has_many :sales, class_name: "Order", foreign_key: "seller_id"
  # has_many :purchases, class_name: "Order", foreign_key: "buyer_id"

  validates :businesses, length: {maximum: 1}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :image
  validates :username, :first_name, :last_name, :street_address, :city, :zipcode, presence: true
 

  #  def self.from_omniauth(auth)
  #    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #    user.email = auth.info.email
  #    user.password = Devise.friendly_token[0,20]
  #  end
  # end

  # def is_seller?s
  # 	profile.username?
  # end

  def subscribed?
 
    stripe_id?
    
  end

  def mailboxer_email(object)
    self.email
  end

  # def hasbusiness?

  #   business.business_created = true

  # end

  def can_receive_payments?
    uid? &&  provider? && access_code? && publishable_key?
  end

end
