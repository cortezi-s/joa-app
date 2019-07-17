class ContactMailer < ApplicationMailer
	def contact_email
		@message = params[:message]		
		mail(from: params[:email], to: 'suporte@joainvestimentos.com.br', subject: params[:subject])
	end
end
