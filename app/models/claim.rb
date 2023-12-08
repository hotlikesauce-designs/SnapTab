# == Schema Information
#
# Table name: claims
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  line_item_id :integer
#  user_id      :integer
#
class Claim < ApplicationRecord
  # Direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :line_item, required: true, class_name: "LineItem", foreign_key: "line_item_id", counter_cache: true

  # Indirect associations
  # Validations
end
