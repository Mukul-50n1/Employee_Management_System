class Address < ApplicationRecord
  belongs_to :employee
  acts_as_paranoid
end
