module Spree
  class KlarnaConfiguration < Preferences::Configuration
    # Ability to activate or inactivate the service globally
    preference :active, :boolean, default: true
    preference :id, :string
    preference :shared_secret, :string
    preference :terms_uri, :string, default: "#{Spree::Config[:site_url]}/terms"
    preference :checkout_uri, :string, default: "#{Spree::Config[:site_url]}/klarna/checkout"
    preference :confirmation_uri, :string, default: "#{Spree::Config[:site_url]}/klarna/confirm"
    preference :push_uri, :string, default: "#{Spree::Config[:site_url]}/klarna/callback"
  end
end
