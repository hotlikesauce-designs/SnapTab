# == Schema Information
#
# Table name: users
#
#  id                             :integer          not null, primary key
#  email                          :string           default(""), not null
#  encrypted_password             :string           default(""), not null
#  memberships_count              :integer
#  own_receipts_count             :integer
#  received_friend_requests_count :integer
#  remember_created_at            :datetime
#  reset_password_sent_at         :datetime
#  reset_password_token           :string
#  sent_friend_requests_count     :integer
#  username                       :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Direct Associations
  has_many  :claims, class_name: "Claim", foreign_key: "user_id", dependent: :destroy
  has_many  :comments, class_name: "Comment", foreign_key: "commenter_id", dependent: :destroy
  has_many  :sent_friend_requests, class_name: "FriendRequest", foreign_key: "sender_id", dependent: :destroy
  has_many  :received_friend_requests, class_name: "FriendRequest", foreign_key: "recipient_id", dependent: :destroy
  has_many  :own_receipts, class_name: "Receipt", foreign_key: "owner_id", dependent: :destroy
  has_many  :memberships, class_name: "Membership", foreign_key: "user_id", dependent: :destroy
  
  # Indirect Associations
  #has_many :following, through: :sent_follow_requests, source: :recipient
  #has_many :followers, through: :received_follow_requests, source: :sender
  has_many :my_groups, through: :memberships, source: :group
  #has_many :feed, through: :following, source: :own_receipts

  # Validations
  validates :email, presence: true
  validates :email, uniqueness: true
  #validates :username, length: { minimum: 3 }
  #validates :username, length: { maximum: 20 }
  
end
