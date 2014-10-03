class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :moderator, index: true, references: :users, null: false

      t.timestamps
    end

    add_index :subs, :title, unique: true
  end
end
