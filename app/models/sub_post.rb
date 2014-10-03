class SubPost < ActiveRecord::Base
  validates_presence_of :post, :sub
  validates :post, uniqueness: { scope: :sub }

  belongs_to :post, inverse_of: :sub_posts
  belongs_to :sub, inverse_of: :sub_posts
end
