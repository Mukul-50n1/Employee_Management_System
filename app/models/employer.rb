class Employer < ApplicationRecord
  has_many :employees ,dependent: :destroy
  belongs_to :user
  has_many :members
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
