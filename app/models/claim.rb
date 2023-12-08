class Claim < ApplicationRecord
  # Direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :line_item, required: true, class_name: "LineItem", foreign_key: "line_item_id", counter_cache: true

  # Indirect associations
  # Validations
  validates :user_id, presence: true
end
