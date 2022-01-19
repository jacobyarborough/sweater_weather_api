class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: :true, length: { minimum: 4 }
  validates :password_confirmation, presence: :true
  validates :password_digest, presence: :true

  has_secure_password
  has_secure_token :auth_token
end
