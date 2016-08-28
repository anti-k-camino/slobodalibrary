class DropTableBooksTags < ActiveRecord::Migration
  def change
    drop_table :books_tags
  end
end
