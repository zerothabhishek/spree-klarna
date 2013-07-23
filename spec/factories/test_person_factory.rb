FactoryGirl.define do
  factory :test_person, parent: :user do
    trait :swedish do
      email "checkout-se@testdrive.klarna.com"
      zip 12345
      personal_identity_number "410321-9202"
    end

    trait :finnish do
      email "checkout-fi@testdrive.klarna.com"
      zip 28100
      personal_identity_number "190122-829F"
    end
  end
end
