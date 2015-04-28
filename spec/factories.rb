FactoryGirl.define do
  sequence :name do |n|
    "person#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    name
    password '12345678'
    email
  end

  factory :expense do
    name 'Jantar'
    value 100
    date { DateTime.now }
    user
  end
end
