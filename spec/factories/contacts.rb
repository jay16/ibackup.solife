# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    phone
    sequence(:id_id) { |n| "id_id_#{n}" }
    sequence(:number) { |n| "number_#{n}" }
    sequence(:name) { |n| "name_#{n}" }
    sequence(:photo) { |n| "photo_#{n}" }
    sequence(:type) { |n| n%2==1 ? "phone" : "sim" }
  end
end
