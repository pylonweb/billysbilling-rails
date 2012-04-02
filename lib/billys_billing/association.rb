module BillysBilling
  # Defines associations methods
  module Association
    
    # Specifie a has many association
    def self.has_one(name, options={})
      attribute = eval("BillysBilling::#{class_name}.new(#{attribute})") unless @attrs[name].nil?
      instance_variable_set("@#{name}".to_sym, attribute)
    end
    
    # Specifie a has many association
    def self.has_many(name, options={})
      attrs = Array(@attrs[name]).map do |attribute|
        class_name = options[:class_name].camelize || name.camelize
        eval("BillysBilling::#{class_name}.new(#{attribute})")
      end
      
      instance_variable_set("@#{name}".to_sym, attrs)
    end

  end
end