# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  receipt_id   :integer
#
class Comment < ApplicationRecord
  # Direct Associations
  belongs_to :commenter, required: true, class_name: "User", foreign_key: "commenter_id"
  belongs_to :receipt, required: true, class_name: "Receipt", foreign_key: "receipt_id", counter_cache: true

  # Indirect Associations
  # Validations
  validates :receipt_id, presence: true
  validates :commenter_id, presence: true
  validates :body, presence: true
  
end
