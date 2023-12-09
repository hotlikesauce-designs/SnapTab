class AddUniqueIndexToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_index :friend_requests, [:sender_id, :user_id], unique: true
    add_index :friend_requests, [:recipient_id, :user_id], unique: true
  end
end
