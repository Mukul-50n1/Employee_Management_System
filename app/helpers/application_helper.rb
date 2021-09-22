module ApplicationHelper
	def current_employers(user_id , employer_id)
		Ability.member(user_id , employer_id)
	end
end
