class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,    null: false
      t.string :explanation,    null: false
      t.integer :status,    null: false
      t.integer :delivery_type,    null: false
      t.integer :postage,    null: false
      t.integer :region,    null: false
      t.integer :shipping_date, null: false
      t.integer :price,    null: false
      t.string :brand
      t.references :category, foreign_key:true
      t.references :saler,    null: false, foreign_key: { to_table: :users }
      t.references :buyer,    foreign_key: { to_table: :users }
      t.timestamps

    end
  end
end
