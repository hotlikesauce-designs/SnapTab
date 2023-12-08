class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.string :caption
      t.string :image
      t.integer :owner_id
      t.string :location
      t.integer :category_id
      t.float :subtotal
      t.float :tax
      t.float :total
      t.datetime :datetime
      t.integer :comments_count
      t.integer :line_items_count

      t.timestamps
    end
  end
end
