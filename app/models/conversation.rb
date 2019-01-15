class Conversation < ApplicationRecord
	belongs_to :author, class_name: "User", foreign_key: "author_id"
	belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

	has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

	validates_uniqueness_of :author_id, scope: :receiver_id
	paginates_per 10

	scope :between, -> (author_id,receiver_id) do
	  where("(conversations.author_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.author_id = ?)", author_id, receiver_id, author_id, receiver_id)
	end

	def recipient(current_user)
	  self.author_id == current_user.id ? self.receiver : self.author
	end

	def unread_personal_message_count(current_user)
      self.personal_messages.where("user_id != ? AND read = ?", current_user.id, false).count
  	end

end
