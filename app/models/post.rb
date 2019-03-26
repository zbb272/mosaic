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
  has_many :comments
  has_many :likes
  has_many :posts_tags
  has_many :tags, through: :posts_tags

  # validates :tag_ids, presence: true, if: -> {
  #   tags_attributes[:name].empty?}
  validates_with TagValidate
  accepts_nested_attributes_for :tags, :reject_if => proc{ |attributes| attributes[:name].blank? }

end
