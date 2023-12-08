class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.integer :creator_id
      t.string :group_description
      t.integer :memberships_count
      t.integer :categories_count

      t.timestamps
    end
  end
end
