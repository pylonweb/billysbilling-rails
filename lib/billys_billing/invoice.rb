module BillysBilling
  module Invoice
    
    def self.list(contact_id = nil)
      BillysBilling.response("/invoices", :get, { :contactId => contact_id })
    end
    
    def self.get(id)
      BillysBilling.response("/invoice/#{id}")
    end
    
    def self.create(params)
      BillysBilling.response("/invoice", :post, params )
    end
    
    def self.update(id, params)
      BillysBilling.response("/invoice/#{id}", :put, params )
    end
    
    def self.delete(id)
      BillysBilling.response("/invoice/#{id}", :delete )
    end
    
  end
end