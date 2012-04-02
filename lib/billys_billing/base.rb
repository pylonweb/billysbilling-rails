

module BillysBilling
  class Base
    
    require "billys_billing/association"
    include BillysBilling::Association
    
    attr_accessor :attrs
    alias :to_hash :attrs
    
    # Specifie a has many association
    def self.has_one(name, options={})
      class_eval do
        define_method name do
          #Twitter.const_get(type.camelize.to_sym)
          attribute = eval("BillysBilling::#{class_name}.new(#{attribute})") unless @attrs[name].nil?
          instance_variable_set("@#{name}".to_sym, attribute)
        end
      end
    end
    
    def self.has_many(name, options={})
      class_eval do
        define_method name do
          attrs = Array(@attrs[name]).map do |attribute|
            class_name = options[:class_name].camelize || name.camelize
            eval("BillysBilling::#{class_name}.new(#{attribute})")
          end
          instance_variable_set("@#{name}".to_sym, attrs)
        end
      end
    end

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
      @attrs = attrs.dup
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