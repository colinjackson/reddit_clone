class RemoveSubIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :sub_id
  end

  def down
    add_column :posts, :sub_id, references: :subs, index: true, null: false
  end
end
