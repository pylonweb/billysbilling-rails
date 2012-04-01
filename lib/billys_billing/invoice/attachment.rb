module BillysBilling
  module Invoice
    module Line
    
      def self.create(invoice_id, params)
        BillysBilling.response("/invoice/#{invoice_id}/attachments", :post, params )
      end
    
      def self.delete(invoice_id, attachment_id)
        BillysBilling.response("/invoice/#{id}/attachments/#{attachment_id}", :delete )
      end
      
    end
  end
end