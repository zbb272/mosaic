class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.most_liked_post
  end

  def self.most_liked_user
  end 
end
