require 'excon'

module Spree
  module Klarna
    class CheckoutHandler #:nodoc:
      # deal with the klarna rest api here
      checkout_url = ""
      sandbox_url  = "https://checkout.testdrive.klarna.com/checkout/orders"  

      def get(params)
      	
      end

      def post(params)
      	
      end

      def url
      	Rails.env.production? ? checkout_url : sandbox_url
      end
    end
  end
end
