class CreateSubPosts < ActiveRecord::Migration
  def change
    create_table :sub_posts do |t|
      t.references :post, index: true, null: false
      t.references :sub, index: true, null: false

      t.timestamps
    end

    add_index :sub_posts, [:post_id, :sub_id], unique: true
  end
end
