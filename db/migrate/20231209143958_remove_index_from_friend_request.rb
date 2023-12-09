class RemoveIndexFromFriendRequest < ActiveRecord::Migration[7.0]
  def change
    
    remove_index :friend_requests, name: "index_friend_requests_on_recipient_id_and_user_id"
    remove_index :friend_requests, name: "index_friend_requests_on_sender_id_and_user_id"
    
    add_index :friend_requests, :sender_id
    add_index :friend_requests, :recipient_id

  end
end
