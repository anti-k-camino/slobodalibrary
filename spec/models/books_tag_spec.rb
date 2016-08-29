require 'rails_helper'

RSpec.describe BooksTag, type: :model do
   it { should have_db_index([:book_id, :tag_id]).unique(true)}

end
