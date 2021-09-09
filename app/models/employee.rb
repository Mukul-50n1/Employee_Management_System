class Employee < ApplicationRecord
	paginates_per 4
	belongs_to :employer
	has_many :addresses ,dependent: :delete_all #,inverse_of: :address 
	accepts_nested_attributes_for :addresses , allow_destroy: true  ,reject_if: :checking?

	acts_as_paranoid

	has_one_attached :image

	belongs_to :designation


	validates :first_name , :last_name ,presence: true ,format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
    message: "only allows letters" }

	# validates :mobile ,numericality: {only_integer: true ,presence: {strict:true} },length: {is: 10}
	validates :doj , :dob  ,presence: true
	validates :email , presence: true ,uniqueness: true
	#validates :password , confirmation: true,presence: true 
	#validates :password_confirmation ,presence: true
	# debugger
	# scope :sea~rch_employee,-> (searchs){ where("first_name LIKE :q OR last_name LIKE :q OR email LIKE :q " ,q: "#{searchs}") }

	def self.search_employee(search)		
      where("first_name LIKE :q OR last_name LIKE :q OR email LIKE :q " ,q: "%#{search}%")    
  end

  def self.search_employee_with_designation(search , designate)
  	where("designation_id IS :d AND first_name LIKE :q OR last_name LIKE :q OR email LIKE :q  " ,d: "#{designate}",q: "%#{search}%")
  end

	private
	def checking?(attr)
		attr['country'].blank? and attr['state'].blank?  and attr['city'].blank? and attr['street_address'].blank?
	end
end