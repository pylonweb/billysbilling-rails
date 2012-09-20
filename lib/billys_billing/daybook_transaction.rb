module BillysBilling
  class DaybookTransaction < BillysBilling::Base
    attr_accessor :id, :created_time, :entry_date, :api_type, :description, :extended_description, :transaction_running_no,
                  :postings, :url, :success
      
    
    has_many :attachments

  end
end