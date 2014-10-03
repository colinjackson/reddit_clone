class Post < ActiveRecord::Base
  validates_presence_of :title, :author_id

  belongs_to :author, class_name: "User", inverse_of: :posts
  has_many :sub_posts, inverse_of: :post
  has_many :subs, through: :sub_posts, source: :sub
end
