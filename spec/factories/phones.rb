# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone do
    sequence(:serial) { |n| "serial_#{n}" }
    sequence(:brand) { |n| "brand_#{n}" }
    sequence(:host) { |n| "host_#{n}" }
    sequence(:fingerprint) { |n| "fingerprint_#{n}" }
    sequence(:manufacturer) { |n| "manufacturer#{n}" }
    sequence(:model) { |n| "model#{n}" }
    sequence(:incremental) { |n| "incremental#{n}" }
    sequence(:product) { |n| "product#{n}" }
    sequence(:device) { |n| "device#{n}" }
    sequence(:release) { |n| "release#{n}" }
  end
end
