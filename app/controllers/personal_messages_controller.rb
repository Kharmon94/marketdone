class PersonalMessagesController < ApplicationController
    before_action :authenticate_user!
    before_action do
      @conversation = Conversation.find(params[:conversation_id])
    end

   load_and_authorize_resource
    
    def index
      if @conversation.author_id == current_user.id
        @personal_messages = @conversation.personal_messages

        @personal_messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)

        @personal_message = @conversation.personal_messages.new
        
      else
        redirect_to conversations_path

      end
    end

    def create
      @personal_message = @conversation.personal_messages.new(personal_message_params)
      @personal_message.user = current_user

      if @personal_message.save
        UserMailer.convo_email(@conversation.receiver).deliver
        redirect_to conversation_personal_messages_path(@conversation)
      end
    end



  def new

    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.personal_messages.build

  end



  private

    def personal_message_params
      params.require(:personal_message).permit(:body, :user_id)
    end

end