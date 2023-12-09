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
class FriendRequest < ApplicationRecord
  # Direct Associations
  belongs_to :sender, required: true, class_name: "User", foreign_key: "sender_id", counter_cache: :sent_friend_requests_count
  belongs_to :recipient, required: true, class_name: "User", foreign_key: "recipient_id", counter_cache: :received_friend_requests_count

  # Indirect Associations
  # Validations
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  validates :recipient_id, uniqueness: { scope: ["sender_id"], message: "already requested" }
  
  # Scope to retrieve accepted friend requests
  scope :accepted, -> {
    where(status: 'accepted')
  }
end
