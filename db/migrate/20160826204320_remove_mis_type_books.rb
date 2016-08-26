class RemoveMisTypeBooks < ActiveRecord::Migration
  def change
    remove_index :books, :user_id_id
    remove_column :books, :user_id_id
    add_reference :books, :user, index: true
  end
end
