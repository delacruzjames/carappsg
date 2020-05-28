class ApplicationForm < ApplicationRecord
  include EmailValidation

  validates :name, presence: true, uniqueness: true
  validates :company, presence: true
  validates :message, presence: true

  belongs_to :member, optional: true
end
