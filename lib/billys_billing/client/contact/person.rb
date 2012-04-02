module BillysBilling
  module Contact
    module Person
    
      def self.create(contact_id, params)
        BillysBilling.response("/contacts/#{contact_id}/persons", :post, params )
      end
    
      def self.update(contact_id, person_id, params)
        BillysBilling.response("/contacts/#{contact_id}/persons/#{person_id}", :put, params )
      end
      
      def self.delete(contact_id, person_id)
        BillysBilling.response("/contacts/#{id}/persons/#{person_id}", :delete )
      end
      
    end
  end
end