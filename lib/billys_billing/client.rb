require 'billys_billing/config'
require 'billys_billing/request'

require 'billys_billing/account'
require 'billys_billing/contact'
require 'billys_billing/invoice'
require 'billys_billing/line'
# require 'billys_billing/'



module BillysBilling
  # Wrapper for the BillysBilling REST API
  
  class Client
    include BillysBilling::Request
    
    attr_accessor *Config::VALID_OPTIONS_KEYS
    
    # Initializes a new API object
    #
    # @param attrs [Hash]
    # @return [BillysBilling::Client]
    def initialize(attrs={})
      attrs = BillysBilling.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end
    
    def method_missing(method, *arguments, &block)
      # the first argument is a Symbol, so you need to_s it if you want to pattern match
      if method.to_s =~ /^(#{valid_actions.join("|")})_(#{valid_queries.join("s?|")})/ && respond_to?($1)
        send($1, *["#{$2.pluralize}"].concat(arguments), &block)
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
      params = get("/#{class_name.camelize(:lower)}/#{id}", options)
      puts "-------------INVOICE START-------------\n#{params.to_yaml}\n-------------INVOICE END-------------"
      get_class_instance(class_name, params)
    end
    # alias_method :get, :show
    
    def index(class_name, params={}, options={})
      params = {q: params} if params.is_a?(String)
      get("/#{class_name.camelize(:lower)}", params, options)
    end
    alias_method :list, :index
    
    def create(class_name, params, options={})
      post("/#{class_name.camelize(:lower)}", params, options)
    end
    alias_method :add, :create
    
    def update(class_name, id, options={})
      put("/#{class_name.camelize(:lower)}/#{id}", params, options)
    end
    
    def destroy(class_name, id, options={})
      delete("/#{class_name.camelize(:lower)}/#{id}", options)
    end
    alias_method :delete, :destroy
    
    private
      
    def get_class_instance(class_name, params)
      "BillysBilling::#{class_name.to_s.classify}".constantize.new(params)
    end
    
  end
end