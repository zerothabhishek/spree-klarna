FactoryGirl.define do
  factory :klarna_payment, class: Spree::KlarnaPayment do
    association(:source, factory: :payment)
    firstname { Faker::Name::first_name }
    lastname  { Faker::Name::last_name }
    personal_identity_number { (10000..20000).sample }
    invoice_number nil
  end
end
