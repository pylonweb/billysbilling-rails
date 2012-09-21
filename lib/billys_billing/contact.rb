module BillysBilling
  class Contact < BillysBilling::Base
    attr_accessor :id, :contact_no, :created_time, :name, 
                  :street, :zipcode, :city, :country_id, :state, :phone, :fax, 
                  :currency, :vat_no, :ean, :locale_id, :url, :persons, :success
                  
    has_many :persons

  end
end