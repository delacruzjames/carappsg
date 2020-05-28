class ApplicationForm < ApplicationRecord
  include EmailValidation

  validates :name, presence: true, uniqueness: true
  validates :company, presence: true
  validates :message, presence: true

  belongs_to :member, optional: true
  
  scope :with_email, -> (email) { where("email LIKE ?", "%#{email}%") }
  scope :submitted_by_member, -> (member) { where(member_id: member) }
  scope :start_of_the_til, -> (date) { where(:created_at => Date.today.beginning_of_day..date.to_date) }

  before_save :verify_email

  def self.search(params)
    if params[:member_email].present?
      submitted_by_member(params[:member_email])
    elsif params[:email].present?
      with_email(params[:email])
    elsif params[:date].present?
      start_of_the_year_to(params[:date])
    else
      all
    end
  end

  private
    def verify_email
      self.member = Member.find_by_email(self.email)
    end
end
