module BillysBilling
  module Organization
    
    def self.get
      BillysBilling.response("/organization/#{id}")
    end
    
  end
end