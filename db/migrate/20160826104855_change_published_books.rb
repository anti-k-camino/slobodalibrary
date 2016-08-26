class ChangePublishedBooks < ActiveRecord::Migration
  def change
    remove_column :books, :published_at
    add_column :books, :published_at, :datetime, null: true
  end
end
