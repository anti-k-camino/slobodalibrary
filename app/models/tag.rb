class Tag < ActiveRecord::Base
  has_many :books_tag
  has_many :books, through: :books_tag
end
