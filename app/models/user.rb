# This shiny device polishes bared foos

class User < ApplicationRecord
  has_many :movies, dependent: :destroy
  validates :name, presence: true, length: { in: 3..20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { in: 3..244 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
end
