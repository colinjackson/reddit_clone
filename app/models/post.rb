class Post < ActiveRecord::Base
  validates_presence_of :title, :author_id

  belongs_to :author, class_name: "User", inverse_of: :posts
  has_many :sub_posts, inverse_of: :post
  has_many :subs, through: :sub_posts, source: :sub

  has_many :comments, inverse_of: :post
  has_many :top_level_comments,
  -> { where("parent_comment_id IS NULL") },
  class_name: 'Comment'

  def comments_by_parent_id
    comments_by_parent_id = Hash.new([])
    self.comments.includes(:author).each do |comment|
      comments_by_parent_id[comment.parent_comment_id] += [comment]
    end

    comments_by_parent_id
  end
end
