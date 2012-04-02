module BillysBilling
  module Payments
    
    def self.list
      BillysBilling.response("/payments", :get)
    end
    
    def self.get(id)
      BillysBilling.response("/payments/#{id}")
    end
    
    def self.create(params)
      BillysBilling.response("/payments", :post, params )
    end
    
  end
end