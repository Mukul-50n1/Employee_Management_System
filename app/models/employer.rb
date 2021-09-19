class Employer < ApplicationRecord
  has_many :employees ,dependent: :destroy
  belongs_to :user
  has_many :memberships
  after_commit :create_admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  private
  def create_admin
    employerin = Employer.last
    employersid= employerin.id
    userin = employerin.user_id
    Membership.create(user_id: userin,role_id: 4 ,user_role: userin ,employer_id: employersid)
  end
end
