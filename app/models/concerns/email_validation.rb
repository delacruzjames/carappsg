module EmailValidation
  extend ActiveSupport::Concern

  included do
    validates :email, presence: true, format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, uniqueness: true
  end
end
