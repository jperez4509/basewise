class User < ActiveRecord::Base
  NAME_REGEX = /\A[a-zA-Z\-\!\@]+\z/
  EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  attr_accessor :password

  validates :first_name, format: { with: NAME_REGEX }, length: (2..100)
  validates :last_name, format: { with: NAME_REGEX }, length: (1..100)
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: true
  validate :password_validity

private

  def password_validity
    unless password =~ /[0-9]+/
      errors.add(:password, "must contain at least one number")
    end

    unless password =~ /[a-zA-Z]+/
      errors.add(:password, "must contain at least one letter")
    end

    unless password =~ /[!@#\$&%\^]+/
      errors.add(:password, "must contain one special character (!, @, #, $, &, %, ^)")
    end

    unless (6..100).cover?(password.length)
      errors.add(:password, "must be at least 6 characters long")
    end
  end
end