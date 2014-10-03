class Sub < ActiveRecord::Base
  validates_presence_of :title, :description, :moderator_id
  validates_uniqueness_of :title

  belongs_to :moderator, class_name: "User", inverse_of: :subs
  has_many :posts, inverse_of: :sub
end
