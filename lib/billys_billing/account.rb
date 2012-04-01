module BillysBilling
  module Account
    
    def self.list(query = nil)
      BillysBilling.response("/accounts", :get, query )
    end
    
    def self.get(id)
      BillysBilling.response("/accounts/#{id}")
    end
    
  end
end