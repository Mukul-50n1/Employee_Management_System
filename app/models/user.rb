class User < ApplicationRecord
  has_many :members
  has_many :employers
  after_commit :create_admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  private
  def create_admin
    usein = User.last.id
    Member.create(user_id: usein,role_id: 4 ,user_role: usein)
  end
end
