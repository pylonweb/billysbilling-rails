module BillysBilling
  class Product < BillysBilling::Base
    attr_accessor :id, :name, :description, :product_type, :product_no, 
                  :suppliers_product_no, :url, :prices, :success

    has_one :account
    has_one :vat_model

  end
end