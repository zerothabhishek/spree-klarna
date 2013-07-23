module Spree
  class KlarnaConfiguration < Preferences::Configuration
    # Ability to activate or inactivate the service globally
    preference :active, :boolean, default: true
  end
end
