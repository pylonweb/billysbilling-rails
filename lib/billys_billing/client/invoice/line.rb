module BillysBilling
  module Invoice
    module Line
    
      def self.create(invoice_id, params)
        BillysBilling.response("/invoices/#{invoice_id}/lines", :post, params )
      end
    
      def self.update(invoice_id, line_id, params)
        BillysBilling.response("/invoices/#{invoice_id}/lines/#{line_id}", :put, params )
      end
    
      def self.delete(invoice_id, line_id)
        BillysBilling.response("/invoices/#{invoice_id}/lines/#{line_id}", :delete )
      end
      
    end
  end
end