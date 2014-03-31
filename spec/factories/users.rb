FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "name#{n}" }
    sequence(:email) { |n| "email_#{n}@solife.us" }
    password "password"
    password_confirmation "password"
  end
end
