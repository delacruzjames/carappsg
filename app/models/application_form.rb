class ApplicationForm < ApplicationRecord
  include EmailValidation

  validates :name, presence: true, uniqueness: true
  validates :company, presence: true
  validates :message, presence: true

  belongs_to :member, optional: true

  before_save :verify_email

  def self.search(params)
    if params[:member_email].present?
      where(member_id: params[:member_email])
    elsif params[:email].present?
      where("email LIKE ?", "%#{params[:email]}%")
    elsif params[:date].present?
      where(:created_at => Date.today.beginning_of_day..params[:date].to_date)
    else
      all
    end
  end

  private
    def verify_email
      self.member = Member.find_by_email(self.email)
    end
end
