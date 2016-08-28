class CreateBooksTags < ActiveRecord::Migration
  def change
    create_table :books_tags do |t|
      t.references :book 
      t.references :tag
      t.timestamps null: false
    end
  end
end
