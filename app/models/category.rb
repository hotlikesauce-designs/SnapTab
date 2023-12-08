# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  category_name  :string
#  receipts_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  group_id       :integer
#
class Category < ApplicationRecord
  # Direct Associations
  belongs_to :group, required: true, class_name: "Group", foreign_key: "group_id", counter_cache: true
  has_many  :receipts, class_name: "Receipt", foreign_key: "category_id", dependent: :destroy
  # Indirect Associations
  # Validations
end
