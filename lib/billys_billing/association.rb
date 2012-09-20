module BillysBilling
  # Defines associations methods
  module Association
    
    # Specifie a has one association
    def has_one(name, options={})
      class_name = options[:class_name] || name
      class_eval do
        # Creating setter method
        define_method("#{name}=") do |attributes|
          class_object = "BillysBilling::#{class_name.to_s.classify}".constantize
          if attributes.is_a?(class_object)
            instance = attributes 
          else
            instance = class_object.new(attributes)
          end
          instance_variable_set("@#{name}", instance)
        end
        # Creating getter method
        define_method(name) do 
          instance_variable_get("@#{name}")
        end
      end
    end
    
    # Specifie a has many association
    def has_many(name, options={})
      class_name = options[:class_name] || name
      instances = []
      class_eval do
        define_method("#{name}=") do |list|
          class_object = "BillysBilling::#{class_name.to_s.classify}".constantize
          list.each do |attributes|
            if attributes.is_a?(class_object)
              instances << attributes 
            else
              instances << class_object.new(attributes)
            end
          end
          instance_variable_set("@#{name}", instances)
        end
        
        define_method(name) do
          instance_variable_get("@#{name}")
        end
      end
    end

  end
end