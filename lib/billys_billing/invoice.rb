module BillysBilling
  module Invoice
    
    def self.list(contact_id = nil)
      query = "?contactId=#{contact_id}" if contact_id
      puts BillysBilling.response("/invoices", :get, { :contactId => contact_id })
    end
    
    def self.get(id)
      BillysBilling.response("/invoice/#{id}")
    end
    
    def self.create(id, params)
      BillysBilling.response("/invoice/#{id}", :post, params )
    end
    
    def self.update(id, params)
      BillysBilling.response("/invoice/#{id}", :put, params )
    end
    
    def self.delete(id, params)
      BillysBilling.response("/invoice/#{id}", :delete )
    end
    
  end
end