class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.string :customer_id
      t.string :card_id
      t.string :token
      t.timestamps
    end
  end
end
