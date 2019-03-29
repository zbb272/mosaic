class TagValidate < ActiveModel::Validator
  def validate(record)
    # byebug
    if record.tags[0].id.nil? && record.tags[0].name.blank?
      # byebug
      record.errors[:post] << "must have a tag"
    end
  end
end


class Post < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  has_one_attached :picture
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :posts_tags, dependent: :destroy
  has_many :tags, through: :posts_tags

  # validates :tag_ids, presence: true, if: -> {
  #   tags_attributes[:name].empty?}
  validates_with TagValidate
  accepts_nested_attributes_for :tags, :reject_if => proc{ |attributes| attributes[:name].blank? }


  def self.post_with_most_likes
    most_liked = nil
    Post.all.each do | post |
      if post.likes.count > most_liked.likes.count
        most_liked = post
      end
    end
    most_liked
  end

  def self.post_with_most_tags
    most_tags = nil
    Posts.all.each do | post |
      if post.tags.count > most_tags.tags.count
        most_tags = post
      end
    end
  end
end
