class Employee < ApplicationRecord
	paginates_per 4
	belongs_to :employer
	has_many :addresses ,dependent: :delete_all #,inverse_of: :address 
	accepts_nested_attributes_for :addresses , allow_destroy: true  ,reject_if: :checking?

	acts_as_paranoid

	has_one_attached :image

	belongs_to :designation


	#validates :first_name , :last_name ,presence: true ,format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
   # message: "only allows letters" }
  after_create  :registration_email
	
	validates :doj , :dob  ,presence: true
	validates :email , presence: true ,uniqueness: true
	

	def self.search_employee(search , designate)	
		if designate.nil? or designate == '0'	
      where("name LIKE :q OR email LIKE :q " ,q: "%#{search}%")
    else
    	design = where("designation_id IS :d" ,d: "#{designate}")
    	design.where("first_name LIKE :q OR last_name LIKE :q OR email LIKE :q " ,q: "%#{search}%")
    end
  end

	private
	def checking?(attr)
		attr['country'].blank? and attr['state'].blank?  and attr['city'].blank? and attr['street_address'].blank?
	end
	def registration_email
		
		#EmployeeMailer.new_employee(self.employee).deliver
	end
end






