module Spree
  class KlarnaAddress < Address
    alias_attribute :given_name, :firstname
    alias_attribute :family_name, :lastname
    alias_attribute :street_address, :address1
    alias_attribute :postal_code, :zipcode
  end
end
