# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
class Membership < ApplicationRecord
  # Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  belongs_to :group, required: true, class_name: "Group", foreign_key: "group_id", counter_cache: true
  
  # Indirect Associations
  # Validations
  validates :user_id, :presence => true
  validates :group_id, :presence => true
  validates :role, :presence => true
  validates :role, :inclusion => { :in => ["member", "admin"] }
  validates :user_id, :uniqueness => { :scope => [:group_id], :message => "already exists in group" }
  
  # Scopes
end
