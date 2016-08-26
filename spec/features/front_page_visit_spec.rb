require 'rails_helper'
feature 'Visit root path', %q{
  In order to get aquainted with resourse
  as an unregistered user 
  I want to visit root path
  } do 
    context 'There are available published books' do
      let!(:books){ create_list(:published_book, 2)}
      let!(:ubooks){ create_list(:book, 2)}
      let(:out_of_date_book){ create :out_of_date_book }

      scenario 'Unregistered user visits root' do
        visit root_path
        within('.weekly') do
          expect(page).to have_content books[0].title
          expect(page).to have_content books[1].title
          expect(page).to_not have_content ubooks[0].title
          expect(page).to_not have_content ubooks[1].title
          expect(page).to_not have_content out_of_date_book.title
        end  
      end  
    end

    context 'There are available published books' do
      
      scenario 'Unregistered user visits root' do
        visit root_path
        within('.weekly') do
          expect(page).to have_content 'No books currently available'          
        end  
      end  
    end
end