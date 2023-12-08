class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.integer :receipt_id
      t.float :cost
      t.float :quantity
      t.boolean :even_split_flag
      t.integer :claims_count

      t.timestamps
    end
  end
end
