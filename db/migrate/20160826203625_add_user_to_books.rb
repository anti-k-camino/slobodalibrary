class AddUserToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :user_id, index: true
  end
end
