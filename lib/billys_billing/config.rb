require 'billys_billing/version'

module BillysBilling
  # Defines constants and methods related to configuration
  module Config
    
    VALID_QUERIES = [
      "contact",
      "invoice",
      "organization",
      "payment",
      "product",
      "vat_model",
      "account"
    ]
    
    VALID_ACTIONS = [
      "show",
      # "get",
      "index",
      "list",
      "create",
      "add",
      "update",
      "destroy",
      "delete"
    ]

    # The api key if none is set
    DEFAULT_API_KEY = nil

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = 'https://api.billysbilling.dk/v1'


    # An array of valid keys in the options hash when configuring a {BillysBilling::Client}
    VALID_OPTIONS_KEYS = [
      :api_key,
      :endpoint,
      :valid_actions,
      :valid_queries
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.api_key            = DEFAULT_API_KEY
      self.endpoint           = DEFAULT_ENDPOINT
      self.valid_actions      = VALID_ACTIONS
      self.valid_queries      = VALID_QUERIES
    end

  end
end