module BillysBilling
  class Invoice < BillysBilling::Base
    attr_accessor :id, :type, :created_time, :approved_time, :invoice_no, :entry_date, 
                  :due_date, :state, :amount, :vat, :exchange_rate, :balance, :is_paid,
                  :contact_message, :print_url, :url, :success,
                  :currency

    has_one :contact
    has_one :att_contact_person, :class_name => "contact"
  
    has_many :lines
    has_many :payments
    has_many :attachments

  end
end