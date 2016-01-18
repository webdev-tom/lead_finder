FactoryGirl.define do
  factory :user do
    first_name "Test"
    last_name "User"
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password "password"
  end
end
