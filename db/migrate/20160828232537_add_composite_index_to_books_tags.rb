class AddCompositeIndexToBooksTags < ActiveRecord::Migration
  def change
    add_index :books_tags, [:book_id, :tag_id], unique: true
  end
end
