class Project < ApplicationRecord
  has_many :assignments
  has_many :vendors, through: :assignments
end
