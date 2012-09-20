module BillysBilling
  class VatModel < BillysBilling::Base
    attr_accessor :id, :name, :description, :url, :rates, :success

    has_one :account

  end
end