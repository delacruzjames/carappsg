class Member < ApplicationRecord
  include EmailValidation
  has_many :application_forms
end
