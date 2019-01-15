class ConversationsController < ApplicationController
	before_action :authenticate_user!


	  def index
	    @conversations = Conversation.where("author_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    	@users = User.where.not(id: current_user.id).search(params[:lookup]).page(params[:page])
	  end

	  def create
	    if Conversation.between(params[:author_id], params[:receiver_id]).present?
	      @conversation = Conversation.between(params[:author_id], params[:receiver_id]).first
	    else
	      @conversation = Conversation.create!(conversation_params)
	    end

	    redirect_to conversation_personal_messages_path(@conversation)
	  end


	  private

	      def conversation_params
		    params.permit(:author_id, :receiver_id)
		  end



end