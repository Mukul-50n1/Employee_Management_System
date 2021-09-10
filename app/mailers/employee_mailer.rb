class EmployeeMailer < ApplicationMailer
	def new_employee(employee)
	  mail(to: employee.email ,subject: 'Welcome mail')
	end
end
