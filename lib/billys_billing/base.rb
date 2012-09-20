require "billys_billing/association"

module BillysBilling
  class Base
    extend BillysBilling::Association 
    
    attr_accessor :attrs
    alias :to_hash :attrs

    # Define methods that retrieve the value from an initialized instance variable Hash, using the attribute as a key
    #
    # @overload self.lazy_attr_reader(attr)
    #   @param attr [Symbol]
    # @overload self.lazy_attr_reader(attrs)
    #   @param attrs [Array<Symbol>]
    def self.lazy_attr_reader(*attrs)
      attrs.each do |attribute|
        class_eval do
          define_method attribute do
            @attrs[attribute.to_s]
          end
        end
      end
    end

    # Initializes a new Base object
    #
    # @param attrs [Hash]
    # @return [Twitter::Base]
    def initialize(attrs={})
      attrs.delete_if{|k,v| v.nil?}.each do |key, value|
        self.send("#{key}=".to_sym, value)
        # instance_variable_set("@#{key}", value)
      end
    end

    # Initializes a new Base object
    #
    # @param method [String, Symbol] Message to send to the object
    def [](method)
      self.__send__(method.to_sym)
    rescue NoMethodError
      nil
    end

  end
end

# autoload :Account,"billys_billing/account"
# autoload :Contact, "billys_billing/contact"
# autoload :Invoice, "billys_billing/invoice"
# autoload :Organization, "billys_billing/organization"
# autoload :Payment, "billys_billing/payment"
# autoload :Product, "billys_billing/product"
# autoload :Vat_model, "billys_billing/vat_model"
# autoload :Line, "billys_billing/line"