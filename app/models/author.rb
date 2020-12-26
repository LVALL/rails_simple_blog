class Author < ApplicationRecord
  has_many :posts
  has_many :comments
  has_secure_password

  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,255})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
  /x.freeze

  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, format: { with: PASSWORD_REQUIREMENTS }, if: -> { new_record? }
end
