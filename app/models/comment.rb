class Comment < ActiveRecord::Base
  validates_presence_of :author, :post

  belongs_to :author, class_name: 'User', inverse_of: :comments

  belongs_to :post, inverse_of: :comments
end
