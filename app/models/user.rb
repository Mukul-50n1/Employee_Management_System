class User < ApplicationRecord
  has_many :memberships
  has_many :employers
  has_many :roles  , through: :memberships
  has_many :employers , through: :memberships
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
