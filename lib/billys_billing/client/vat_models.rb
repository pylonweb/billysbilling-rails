module BillysBilling
  module VatModels
    
    def self.list(query = nil)
      BillysBilling.response("/vatModels", :get, {:q => query} )
    end
    
    def self.get(id)
      BillysBilling.response("/vatModels/#{id}")
    end
    
  end
end