class ChangereceivedFollowRequestsCountToreceivedFriendRequestsCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :received_follow_requests_count, :received_friend_requests_count
    rename_column :users, :sent_follow_requests_count, :sent_friend_requests_count
  end
end
