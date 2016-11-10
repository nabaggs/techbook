class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.string :state,default: "pending"
      t.integer :friend_id
      t.datetime :friended_at

      t.timestamps
    end
  end
end
