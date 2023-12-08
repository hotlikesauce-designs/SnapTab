# == Schema Information
#
# Table name: line_items
#
#  id              :integer          not null, primary key
#  claims_count    :integer
#  cost            :float
#  even_split_flag :boolean
#  quantity        :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  receipt_id      :integer
#
class LineItem < ApplicationRecord
  # Direct associations
  belongs_to :receipt, required: true, class_name: "Receipt", foreign_key: "receipt_id", counter_cache: true
  has_many  :claims, class_name: "Claim", foreign_key: "line_item_id", dependent: :destroy
  
  # Indirect associations
  # Validations

end
