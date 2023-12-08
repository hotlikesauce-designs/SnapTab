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
