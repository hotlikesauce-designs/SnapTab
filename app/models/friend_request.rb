# == Schema Information
#
# Table name: friend_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
# Indexes
#
#  index_friend_requests_on_recipient_id_and_user_id  ("recipient_id", "user_id") UNIQUE
#  index_friend_requests_on_sender_id_and_user_id     ("sender_id", "user_id") UNIQUE
#
class FriendRequest < ApplicationRecord
  # Direct Associations
  belongs_to :sender, required: true, class_name: "User", foreign_key: "sender_id", counter_cache: :sent_friend_requests_count
  belongs_to :recipient, required: true, class_name: "User", foreign_key: "recipient_id", counter_cache: :received_friend_requests_count

  # Indirect Associations
  # Validations

  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  
  validates :user_id, uniqueness: { scope: [:sender_id, :recipient_id] }
  validates :recipient_id, uniqueness: { scope: ["sender_id"], message: "already requested" }
  
  # Scope to retrieve accepted friend requests
  scope :accepted, -> {
    where(status: 'accepted')
  }
end
