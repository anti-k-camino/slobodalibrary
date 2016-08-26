FactoryGirl.define do
 sequence :title do |n|
    "MyTitle#{n}"
  end
  
  factory :book do
    title
    description 'MyDescription'
    author 'MyAuthor'
  end
end
