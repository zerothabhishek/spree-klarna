class CreateKlarnaPayments < ActiveRecord::Migration
  def change
    create_table :spree_klarna_payments, force: true do |t|
      t.string :personal_identity_number
      t.string :invoice_number

      t.timestamps
    end
  end
end
