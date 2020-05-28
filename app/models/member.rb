class Member < ApplicationRecord
  include EmailValidation
  validates :email, uniqueness: true
  has_many :application_forms
end
