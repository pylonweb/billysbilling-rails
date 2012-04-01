module BillysBilling
  module Product
    
    def self.list(query = nil)
      BillysBilling.response("/products", :get, { :q => query } )
    end
    
    def self.get(id)
      BillysBilling.response("/products/#{id}")
    end
    
    def self.create(params)
      BillysBilling.response("/products", :post, params )
    end
    
    def self.update(id, params)
      BillysBilling.response("/products/#{id}", :put, params )
    end
    
    def self.delete(id)
      BillysBilling.response("/products/#{id}", :delete )
    end
    
  end
end