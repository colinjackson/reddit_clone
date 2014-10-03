class Post < ActiveRecord::Base
  validates_presence_of :title, :sub_id, :author_id

  belongs_to :sub, inverse_of: :posts
  belongs_to :author, class_name: "User", inverse_of: :posts
end
