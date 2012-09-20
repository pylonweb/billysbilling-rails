module BillysBilling
  class Payment < BillysBilling::Base
    attr_accessor :id, :type, :created_time, :paid_date, :amount, :currency, :invoice_currency, :exchange_rate, :url, :success
    
    has_one :contact
    has_one :account
    
    has_many :invoices

  end
end