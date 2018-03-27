class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :profile
  has_many :products
  has_many :businesses
  has_many :charges
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"

  #  def self.from_omniauth(auth)
  #    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #    user.email = auth.info.email
  #    user.password = Devise.friendly_token[0,20]
  #  end
  # end

  # def is_seller?
  # 	profile.username?
  # end

  def subscribed?
 
    stripe_id?
    
  end

  def can_receive_payments?
    uid? &&  provider? && access_code? && publishable_key?
  end

end
