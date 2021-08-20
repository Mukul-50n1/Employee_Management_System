class Employee < ApplicationRecord
	belongs_to :employer
	has_many :addresses ,dependent: :destroy #,inverse_of: :address 
	accepts_nested_attributes_for :addresses , allow_destroy: true  ,reject_if: :checking?
	has_one_attached :image#seee this line

	validates :first_name , :last_name ,presence: true ,format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
    message: "only allows letters" }

	# validates :mobile ,numericality: {only_integer: true ,presence: {strict:true} },length: {is: 10}
	validates :doj , :dob  ,presence: true
	validates :email , presence: true ,uniqueness: true
	#validates :password , confirmation: true,presence: true 
	#validates :password_confirmation ,presence: true

	private
	def checking?(attr)
		attr['country'].blank? and attr['state'].blank?  and attr['city'].blank? and attr['street_address'].blank?
	end
end
