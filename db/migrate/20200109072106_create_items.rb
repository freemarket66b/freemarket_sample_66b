class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,    null: false
      t.string :explanation,    null: false, index: true
      t.string :status,    null: false
      t.string :delivery_type,    null: false
      t.string :postage,    null: false
      t.string :region,    null: false
      t.string :shipping_date, null: false
      t.integer :price,    null: false
      t.string :brand
      t.references :category, foreign_key:true
      t.references :saler_id,    null: false, foreign_key: { to_table: :users }
      t.references :buyer_id,    foreign_key: { to_table: :users }
      t.timestamps

      remove_index
    end
  end
end
