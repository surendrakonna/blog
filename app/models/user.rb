class User < ApplicationRecord
  has_secure_password

  has_many :articles, foreign_key: :author_id

  validates :email, presence: true, email: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6  }, on: :create

  before_create :generate_authentication_token

  def generate_authentication_token
    self.authentication_token = SecureRandom.hex(16)
  end
end
