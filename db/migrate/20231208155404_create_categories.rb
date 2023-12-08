class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.integer :group_id
      t.string :category_name
      t.integer :receipts_count

      t.timestamps
    end
  end
end
