class Membership < ApplicationRecord
	belongs_to :role
	belongs_to :user
	belongs_to :employer
	validate :member_validation


	private
	def member_validation
		allcheck = Membership.where('user_id IS ? AND role_id IS ? AND user_role IS ?AND employer_id IS ?',user_id,role_id,user_role,employer_id)
		repeatrole = Membership.where('role_id IS ? AND employer_id IS ? ',role_id,employer_id)
		repeatuser = Membership.where('employer_id IS ? AND user_role IS ? ',employer_id,user_role)
	
		if !allcheck.blank?
			errors.add(:user_role , 'this role has already accessed') 
			return false
		elsif !repeatrole.blank?
			errors.add(:role_id , 'role will not repeat')
		elsif !repeatuser.blank?
			errors.add(:user_role,'user will not repeat in same employer')
		else 
			return true 
		end
	end
end
