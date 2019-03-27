class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: true
end
