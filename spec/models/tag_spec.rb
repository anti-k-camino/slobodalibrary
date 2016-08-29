require 'rails_helper'

RSpec.describe Tag, type: :model do
  it {should have_many :books }
  it {should have_many :books_tag }  
  it {should validate_presence_of :name } 
end
