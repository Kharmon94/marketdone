class ContactsController < ApplicationController
	


	def create
		@contact = Contact.new(contact_params)

		if @contact.save
			redirect_to root_path
			name = params[:contact][:name]
			email = params[:contact][:email]
			message = params[:contact][:message]
			ContactMailer.contact_email(name, email, message)
			flash[:success] = "Thanks for the message, we will be in touch soon"
		else
			redirect_to root_path
			flash[:danger] = "Opps, there was a problem! Please fill out all the fields"

		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
	
	
end