FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Smith"
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password "password"
  end
end
