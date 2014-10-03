class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :activation_token
      t.boolean :activated, default: false, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :activation_token, unique: true
  end
end
