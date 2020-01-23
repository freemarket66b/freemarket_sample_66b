class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.references :item_id, null: false, foreign_key: { to_table: :items }    
      t.timestamps
    end
  end
end