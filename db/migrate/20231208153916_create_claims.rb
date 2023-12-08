class CreateClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :claims do |t|
      t.integer :user_id
      t.integer :line_item_id

      t.timestamps
    end
  end
end
