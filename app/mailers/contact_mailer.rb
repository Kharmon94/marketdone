class ContactMailer < ApplicationMailer
	default to: "theblackwomanisgodstores@gmail.com"

	def contact_email(name, email, message)
		@name = name
		@email = email
		@message = message

		mail(from: email, subject: "Support Message!")
	end
end
