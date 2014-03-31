# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sm do
    phone
    sequence(:id_id) { |n| "id_id_#{n}" }
    sequence(:number) { |n| "number_#{n}" }
    sequence(:name) { |n| "name_#{n}" }
    sequence(:date) { |n| Time.now.stftime("%Y-%m-%d %H:%M:%S") }
    sequence(:content) { |n| "content#{n}" }
    sequence(:type) { |n| (n%2).to_s }
  end
end
