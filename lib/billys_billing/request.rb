require "httparty"
require 'multi_json'

module BillysBilling
  # Defines HTTP request methods
  module Request
    
    # Perform an HTTP DELETE request
    def delete_request(path, params={}, options={})
      request(:delete, path, params, options)
    end

    # Perform an HTTP GET request
    def get_request(path, params={}, options={})
      request(:get, path, params, options)
    end

    # Perform an HTTP POST request
    def post_request(path, params={}, options={})
      request(:post, path, params, options)
    end
    
    # Perform an HTTP PUT request
    def put_request(path, params={}, options={})
      request(:put, path, params, options)
    end
    
  private

    # Perform an HTTP request
    def request(method, path, params, options)
      puts "METHOD: #{method}\nPATH: #{path}\nPARAMS: #{params.billyfy_keys!}\nOPTIONS: #{options}"
      params = params.billyfy_keys!
      auth = {username: api_key, password: ""}
      case method.to_sym
      when :get
        response = HTTParty.get(endpoint + path, :query => params, :basic_auth => auth)
      when :post
        response = HTTParty.post(endpoint + path, :body => MultiJson.encode(params), :basic_auth => auth)
      when :delete
        response = HTTParty.delete(endpoint + path, :query => params, :basic_auth => auth)
      when :put
        response = HTTParty.put(endpoint + path, :body => MultiJson.encode(params), :basic_auth => auth)
      else
      end

      options[:raw] ? response : response.parsed_response.rubyify_keys!
    end

  end
end