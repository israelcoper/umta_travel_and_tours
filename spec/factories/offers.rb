FactoryGirl.define do
  sequence(:location) {|n| "Location #{n}"}

  factory :offer do
    category "default"
    location { generate(:location) }
    detail { FFaker::Lorem.sentence }
    rate "1000.0"
    image { Rack::Test::UploadedFile.new("spec/support/fixtures/image.png", 'image/png') }

    factory :invalid_offer do
      location ""
      detail ""
      rate ""
      image ""
    end
  end
end
