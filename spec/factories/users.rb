FactoryGirl.define do

  sequence :name do |n|
    "SomeName#{n}"
  end
  sequence :email do |n|
    "someemail#{n}@gmail.com"
  end

  factory :user do
    name
    email
    password '123456'
  end

  factory :admin, class: User do
    name "admin"
    email "admin@gmail.com"
    password "123456"
    admin true
  end
end
