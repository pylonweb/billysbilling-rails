module BillysBilling
  class Organization < BillysBilling::Base
    attr_accessor :id, :name, :street, :zipcode, :city, :country, :phone, :fax, :email, 
                  :registration_no, :base_currency, :is_demo, :currencies, :success

  end
end