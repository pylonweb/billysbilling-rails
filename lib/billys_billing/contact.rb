module BillysBilling
  module Contact
    
    def self.list(query = nil)
      puts BillysBilling.response("/contacts", :get, { :q => query })
    end
    
    def self.get(id)
      BillysBilling.response("/contacts/#{id}")
    end
    
    def self.create(params)
      BillysBilling.response("/contacts", :post, params )
    end
    
    def self.update(id, params)
      BillysBilling.response("/contacts/#{id}", :put, params )
    end
    
    def self.delete(id)
      BillysBilling.response("/contacts/#{id}", :delete )
    end
    
  end
end