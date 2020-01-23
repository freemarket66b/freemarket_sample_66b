class RenameItemIdColumnToImages < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :item_id_id, :item_id
  end
end