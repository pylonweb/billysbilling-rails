module BillysBilling
  class Line < BillysBilling::Base
    attr_accessor :id, :description, :quantity, :unit_price, :discount_text, :discount_mode, :discount_value, :amount, :vat,
                  :vat_model

    # belongs_to :invoice
    has_one :product
    has_one :vat_model

  end
end