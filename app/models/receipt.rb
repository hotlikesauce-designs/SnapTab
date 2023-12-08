# == Schema Information
#
# Table name: receipts
#
#  id               :integer          not null, primary key
#  caption          :string
#  comments_count   :integer
#  datetime         :datetime
#  image            :string
#  line_items_count :integer
#  location         :string
#  subtotal         :float
#  tax              :float
#  total            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#  owner_id         :integer
#
class Receipt < ApplicationRecord
  # Direct associations
  belongs_to :owner, required: true, class_name: "User", foreign_key: "owner_id", counter_cache: :own_receipts_count
  has_many  :comments, class_name: "Comment", foreign_key: "receipt_id", dependent: :destroy
  has_many  :line_items, class_name: "LineItem", foreign_key: "receipt_id", dependent: :destroy
  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id", counter_cache: true

  # Indirect associations
  has_one  :group, through: :category, source: :group
  
  # Validations
  validates :owner_id, presence: true
  validates :image, presence: true

end
