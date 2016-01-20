FactoryGirl.define do
  factory :lead do
    sequence(:company_id) { |n| "#{n}" }
    company_name "3M"
    phys_address "123 Company Road"
    phys_city "Rockland"
    phys_state "MA"
    phys_zip "01520"
    employees_on_site 60
  end
end
