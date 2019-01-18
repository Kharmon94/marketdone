class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  # acts_as_obfuscated :format => '###-####-###'
  acts_as_follower
  acts_as_followable
  acts_as_liker

  # has_one :profile
  has_many :products, dependent: :destroy
  has_many :businesses, dependent: :destroy
  has_many :charges
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :sales, class_name: "Order", foreign_key: "seller_id"
  # has_many :purchases, class_name: "Order", foreign_key: "buyer_id"

  validates :businesses, length: {maximum: 1}

  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/, default_url: "default.png"
  # validates_attachment_presence :image
  validates :username, :first_name, :last_name, :street_address, :city, :zipcode, presence: true
  
  has_many :personal_messages, dependent: :destroy
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  paginates_per 40
 

  #  def self.from_omniauth(auth)
  #    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #    user.email = auth.info.email
  #    user.password = Devise.friendly_token[0,20]
  #  end
  # end

  def self.search(lookup)
    if lookup
      where('username LIKE ? OR email LIKE ?', "%#{lookup}%", "%#{lookup}%").order('id DESC')
    else
      order('id DESC') 
    end
 end


  def subscribed?
 
    stripe_id?
    
  end

  def can_receive_payments?
    uid? &&  provider? && access_code? && publishable_key?
  end

end


    private

    def already_voted?
      Vote.where(user_id: current_user.id, product_id:
      params[:product_id]).exists?
    end