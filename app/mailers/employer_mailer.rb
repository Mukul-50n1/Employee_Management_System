class EmployerMailer < ApplicationMailer
	def newEmployee
		@employee = params[:employee]
		mail(to: @employee.email ,subject: 'Welcome mail')
	end
end
