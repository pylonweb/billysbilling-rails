require 'billys_billing/base'

module BillysBilling
  class Invoice < BillysBilling::Base
    require "billys_billing/association"
    include BillysBilling::Association
    lazy_attr_reader  :id, :type, :createdTime, :approvedTime, :invoiceNo, :entryDate, 
                      :dueDate, :state, :amount, :vat, :exchangeRate, :balance, :isPaid,
                      :contactMessage, :printUrl, :url

    has_one :contact
    has_one :attContactPerson, :class_name => "contact"
    has_one :currency
  
    has_many :lines
    has_many :payments
    has_many :attachments

  end
end