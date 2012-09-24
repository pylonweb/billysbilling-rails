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
      if method.to_s =~ /^(#{valid_actions.join("|")})_(#{valid_queries.join("s?|")})(!?)/ && respond_to?($1)
        puts "METHOD: #{$1}#{$3}\nARGUMENTS: #{[$2.pluralize.camelize(:lower)].concat(arguments)}"
        send("#{$1}#{$3}", *[$2.pluralize].concat(arguments), &block)
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
    
    def show!(class_name, id, options={})
      show(class_name, id, options.merge({return_error_message: true}))
    end
    alias_method :find!, :show!
    alias_method :get!, :show!
    
    def index!(class_name, params={}, options={})
      index(class_name, params, options.merge({return_error_message: true}))
    end
    alias_method :list!, :index!
    
    def create!(class_name, params, options={})
      create(class_name, params, options.merge({return_error_message: true}))
    end
    alias_method :new!, :create!
    alias_method :add!, :create!
    
    def update!(class_name, id, params, options={})
      update(class_name, id, params, options.merge({return_error_message: true}))
    end
    
    def destroy!(class_name, id, options={})
      destroy(class_name, id, options.merge({return_error_message: true}))
    end
    alias_method :delete!, :destroy!
    
    def show(class_name, id, options={})
      response = get_request("/#{class_name}/#{id}", options)
      puts "SHOW RESPONSE #{response.to_yaml}"
      if response.success?
        get_class_instance(class_name, response)
      else
        options[:return_error_message] ? response["error"] : false
      end
    end
    alias_method :find, :show
    alias_method :get, :show
    
    def index(class_name, params={}, options={})
      params = {q: params} if params.is_a?(String)
      
      list = []
      response = get_request("/#{class_name}", params, options)
      if response.success?
        response[class_name].each do |instance|
          list << get_class_instance(class_name, instance)
        end
        return list
      else
        options[:return_error_message] ? response["error"] : false
      end
      
    end
    alias_method :list, :index
    
    def create(class_name, params, options={})
      response = post_request("/#{class_name}", params, options)
      puts "CREATE RESPONSE #{response.to_yaml} - #{response.success?}"
      if response.success?
        show(class_name, response["id"], options)
      else
        options[:return_error_message] ? response["error"] : false
      end
    end
    alias_method :new, :create
    alias_method :add, :create
    
    def update(class_name, id, params, options={})
      response = put_request("/#{class_name}/#{id}", params, options)
      if response.success?
        show(class_name, id, options)
      else
        options[:return_error_message] ? response["error"] : false
      end
    end
    
    def destroy(class_name, id, options={})
      item = show(class_name, id, options)
      response = delete_request("/#{class_name}/#{id}", options)
      if response.success?
        return item
      else
        options[:return_error_message] ? response["error"] : false
      end
    end
    alias_method :delete, :destroy
    
    private
      
    def get_class_instance(class_name, params)
      puts params.to_yaml
      "BillysBilling::#{class_name.to_s.classify}".constantize.new(params)
    end
    
  end
end