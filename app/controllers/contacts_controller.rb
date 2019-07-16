class ContactsController < ApplicationController
	def create
		ContactMailer.with(contact_params).contact_email.deliver_later
		head :ok
	end

	private

		def contact_params
			params.require(:contact).permit(:name, :email, :subject, :message)
		end
end
