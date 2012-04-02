# billysbilling-rails

A Ruby wrapper for the [Billys Billing API](https://dev.billysbilling.dk/api)


## Installation

Add this line to your application's Gemfile:

    gem 'billysbilling-rails'


Or install it yourself as:

    $ gem install billysbilling-rails
   
## Configuration

Simply supply your Billys Billing API key in an initializer

    BillysBilling.configuration do |config|
    	config.api_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    end
    
Now you can fetch data from Billys Billing by querying the BillysBilling class directly

	BillysBilling.invoices # Returns all invoices
	
	BillysBilling.invoice({invoiceID}) # Returns the invoice with the specified id.
	
Or you can instantiate your own instance of the class with the API_KEY set automatically

	client = BillysBilling.new
	
\- **OR** -


If you for some reason need multiple instances of the client and do not want to have a default API_KEY you can specify the key when instantiating:

	client1 = BillysBilling.new(:api_key => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
	client2 = BillysBilling.new(:api_key => "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY")
	



## Usage Examples

Get all invoices

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
