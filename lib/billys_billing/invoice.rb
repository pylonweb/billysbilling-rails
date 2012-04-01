module BillysBilling
  module Invoice
    
    def self.list
      BillysBilling.response("/invoices")
    end
    
    def self.get(id)
      BillysBilling.response("/invoice/#{id}")
    end
    
  end
end