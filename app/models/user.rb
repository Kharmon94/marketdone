class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  acts_as_follower
  acts_as_followable

  has_many :products, dependent: :destroy
  has_many :businesses, dependent: :destroy
  has_many :charges
  has_many :reviews, dependent: :destroy

  validates :businesses, length: {maximum: 1}
  # validate :correct_image_type

  has_one_attached :avatar, dependent: :destroy
  validates :avatar, presence: true, blob: { content_type: :image }
  # has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/, default_url: "default.png"
  # validates_attachment_presence :image
  validates :username, :first_name, :last_name, :street_address, :city, :zipcode, presence: true
  
  has_many :personal_messages, dependent: :destroy
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  paginates_per 40
 
  make_permalink :username    

  def to_param
    permalink
  end

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

    # def correct_image_type
    #   if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/jpg image/png))
    #     errors.add(:avatar, 'must be a JPEG, PNG, JPG')
    #   end
    # end