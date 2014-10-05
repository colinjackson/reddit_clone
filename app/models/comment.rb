class Comment < ActiveRecord::Base
  validates_presence_of :author, :post

  belongs_to :author, class_name: 'User', inverse_of: :comments
  belongs_to :post, inverse_of: :comments

  belongs_to :parent_comment,
  class_name: 'Comment',
  inverse_of: :child_comments

  has_many :child_comments,
  class_name: 'Comment',
  foreign_key: :parent_comment_id,
  inverse_of: :parent_comment
end
