class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: true


  #returns sorted array of tags liked by user in order of most likes
  def liked_tags
    liked_tags = {}
    self.likes.each do |like|
      like.post.tags.each do | tag |
        if liked_tags[tag] == nil
          liked_tags[tag] = 1
        else
          liked_tags[tag] += 1
        end
      end
    end

    sorted_liked_tags = liked_tags.sort_by do | tag, number_of_likes |
      number_of_likes
    end
    # sorted_liked_tags.collect do | tag, num |
    #   tag
    # end
  end

  #returns sorted array of users liked by user in order of most likes
  def liked_users
    liked_users = {}
    self.likes.each do |like|
      if liked_users[like.post.user] == nil
        liked_users[like.post.user] = 1
      else
        liked_users[like.post.user] += 1
      end
    end
    sorted_liked_users = liked_users.sort_by do | user, number_of_likes |
      number_of_likes
    end
    # sorted_liked_users.collect do | user, num |
    #   user
    # end
  end

  def liked_posts
    liked = self.likes.collect do |like|
      like.post
    end
  end

  def feed_posts
    posts = liked_posts

    # posts = User.likes.posts.sample(15)
    # liked_tags(user).each do |tag|
    #   posts += tag.posts.sample(60 / liked_tags.length)
    # end
    # liked_users(user).each do |u|
    #   posts += u.posts.sample(25 / liked_tags.length)
    # end
    # posts += (Post.all - posts).sample(100 - posts.length)
    # posts
  end

  def self.user_with_most_posts
    user_with_most = nil
    User.all.each do | user |
      if user.posts.count > user_with_most.posts.count
        user_with_most = user
      end
    end
    user_with_most
  end

  # def self.user_with_most_likes
  #   user_with_most = nil
  #   most_likes = 0
  #   User.all.each do | user |
  #     user.posts.each do | post |
  #
  #     end
  #   end
  # end

end
