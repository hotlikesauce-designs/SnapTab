# == Schema Information
#
# Table name: groups
#
#  id                :integer          not null, primary key
#  categories_count  :integer
#  group_description :string
#  group_name        :string
#  memberships_count :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  creator_id        :integer
#
class Group < ApplicationRecord
  # Direct Associations
  has_many  :memberships, class_name: "Membership", foreign_key: "group_id", dependent: :destroy
  has_many  :categories, class_name: "Category", foreign_key: "group_id", dependent: :destroy

  # Indirect Associations
  has_many :members, through: :memberships, source: :user
  has_many :receipts, through: :categories, source: :receipts
  
  # Validations
end
