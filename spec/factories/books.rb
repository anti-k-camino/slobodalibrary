FactoryGirl.define do
  sequence :title do |n|
    "MyTitle#{n}"
  end
  
  factory :book do
    title
    description 'MyDescription'
    author 'MyAuthor'
  end

  factory :published_book, class:'Book' do
    title
    description 'MyDescription'
    author 'MyAuthor'
    published_at DateTime.now
  end

  factory :out_of_date_book, class:'Book' do
    title
    description 'MyDescription'
    author 'MyAuthor'
    published_at DateTime.now - 8
  end


  factory :front_book, class:'Book' do
    title
    description 'MyDescription'
    author 'MyAuthor'
    after :create do |b|
      b.update_column(:front, "spec/support/Bjarne.jpg")
    end
  end

end


