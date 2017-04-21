FactoryGirl.define do
  sequence(:location) {|n| "Location #{n}"}

  factory :offer do
    category "default"
    location { generate(:location) }
    detail { FFaker::Lorem.sentence }
    rate "1000.0"

    factory :invalid_offer do
      location ""
      detail ""
      rate ""
    end
  end
end
