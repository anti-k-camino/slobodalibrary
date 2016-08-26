require 'rails_helper'
feature 'Visit root path', %q{
  In order to get aquainted with resourse
  as an unregistered user 
  I want to visit root path
  } do 
    let!(:books){ create_list(:book, 2)}
    scenario 'Unregistered user visits root' do      
    end  
end