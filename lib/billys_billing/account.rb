module BillysBilling
  class Account < BillysBilling::Base
    attr_accessor :id, :account_number, :name, :description, :account_type, 
                  :system_role, :is_payment_enabled, :url, :success

  end
end