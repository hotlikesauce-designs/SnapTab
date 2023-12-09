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
#  index_friend_requests_on_recipient_id  (recipient_id)
#  index_friend_requests_on_sender_id     (sender_id)
#
class FriendRequest < ApplicationRecord
  # Direct Associations
  belongs_to :sender, required: true, class_name: "User", foreign_key: "sender_id", counter_cache: :sent_friend_requests_count

  belongs_to :recipient, required: true, class_name: "User", foreign_key: "recipient_id", counter_cache: :received_friend_requests_count
  
  enum status: { pending: "pending", rejected: "rejected", accepted: "accepted" }
  # Automatic scopes from enum :status
  # scope :accepted, -> { where(status: "accepted" ) }
  # scope :not_accepted, -> { where.not(status: "accepted" ) }

  # Indirect Associations
  # Validations

  validates :sender_id, presence: true
  validates :recipient_id, presence: true

  validates :recipient_id, uniqueness: { scope: ["sender_id"], message: "already requested" }
  
  validate :users_cant_friend_themselves

  def users_cant_friend_themselves
    if sender_id == recipient_id
      errors.add(:sender_id, "can't friend themselves")
    end
  end
end
