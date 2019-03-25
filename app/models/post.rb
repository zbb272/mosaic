class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :posts_tags
  has_many :tags, through: :posts_tags
end
