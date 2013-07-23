module Spree
  class PaymentMethod::KlarnaInvoice < PaymentMethod
    def auto_capture?
      false
    end

    def source_required?
      true
    end

    def payment_source_class
      Spree::KlarnaPayment
    end

    def payment_profiles_supported?
      true
    end

    def purchase(money, payment_source, options={})
      return payment_source.process!
    end
  end
end
