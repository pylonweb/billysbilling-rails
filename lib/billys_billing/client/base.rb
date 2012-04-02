module BillysBilling
  class Client
    module Base
      
      def method_missing(method, *arguments, &block)
        # the first argument is a Symbol, so you need to_s it if you want to pattern match
        if method.to_s =~ /^(#{valid_actions.join("|")})_(#{valid_queries.join("|")})/
          # raise "#{$1} '#{$2}'#{',' unless arguments.empty?} #{arguments.join(",")}"
          eval("#{$1} '#{$2}'#{',' unless arguments.empty?} #{arguments.join(",")}")
        else
          super
        end
      end
      
      def respond_to?(method, include_private=false)
        if method.to_s =~ /^(#{valid_actions.join("|")})_(#{valid_queries.join("|")})/
          true
        else
          super
        end
      end
      
      def show(class_name, id, options={})
        get("/#{class_name}", options)
      end
      
      def index(class_name, options={})
        get("/#{class_name}", options)
      end
      
      def create(class_name, params, options={})
        post("/#{class_name}", params, options)
      end
      
      def update(class_name, id, options={})
        put("/#{class_name}/#{id}", params, options)
      end
      
      def destroy(class_name, id, options={})
        delete("/#{class_name}/#{id}", options)
      end
    
    end
  end
end