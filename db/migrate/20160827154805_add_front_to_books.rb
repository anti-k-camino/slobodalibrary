class AddFrontToBooks < ActiveRecord::Migration
  def change
    add_column :books, :front, :string
  end
end
