class CreateSubPosts < ActiveRecord::Migration
  def change
    create_table :sub_posts do |t|
      t.references :post, index: true
      t.references :sub, index: true

      t.timestamps
    end
  end
end
