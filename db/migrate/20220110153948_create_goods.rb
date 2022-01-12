class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.string  :items_name,          null: false
      t.text    :items_explanation,   null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :price,               null: false
      t.integer :payment_id,          null: false
      t.integer :prefecture_id,       null: false
      t.integer :delivery_id,         null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
