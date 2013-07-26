class Spree::KlarnaPayment < ActiveRecord::Base
  has_many :payments, as: :source
  validates :personal_identity_number, presence: true
  attr_accessible :personal_identity_number, :invoice_number
end
