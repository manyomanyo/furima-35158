class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,             null: false
      t.text :description,        null: false
      t.integer :price,           null: false
      t.references :user,         null: false, foreign_key: true
      t.integer :item_state_id,   null: false
      t.integer :category_id,     null: false
      t.integer :delivery_fee_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :user_area_id,    null: false
      t.timestamps
    end
  end
end
