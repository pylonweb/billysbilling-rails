module BillysBilling
  class Organization < BillysBilling::Base
    attr_accessor :id, :name, :street, :zipcode, :city, :country_id, :phone, :fax, :email, 
                  :registration_no, :base_currency, :is_demo, :currencies, :success,
                  :country

  end
end