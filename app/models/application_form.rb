class ApplicationForm < ApplicationRecord
  include EmailValidation

  validates :name, presence: true, uniqueness: true
  validates :company, presence: true
  validates :message, presence: true

  belongs_to :member, optional: true

  before_save :verify_email

  private
    def verify_email
      self.member = Member.find_by_email(self.email)
    end
end
