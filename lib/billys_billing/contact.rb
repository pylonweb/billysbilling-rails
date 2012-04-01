module BillysBilling
  module Contact
    
    def self.list(contact_id = nil)
      query = "?contactId=#{contact_id}" if contact_id
      puts BillysBilling.response("/invoices#{query}")
    end
    
    def self.get(id)
      BillysBilling.response("/invoice/#{id}")
    end
    
    def self.create(id)
      BillysBilling.response("/invoice/#{id}", :post)
    end
    
  end
end