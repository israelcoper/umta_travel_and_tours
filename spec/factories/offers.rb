FactoryGirl.define do
  sequence(:location) {|n| "Location #{n}"}

  factory :offer do
    offer_type 0
    location { generate(:location) }
    detail { FFaker::Lorem.sentence }
    rate "1000.0"

    factory :invalid_offer do
      location nil
      detail nil
      rate nil
    end
  end
end
