class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.references :sub, index: true, null: false
      t.references :author, index: true, references: :users, null: false

      t.timestamps
    end
  end
end
