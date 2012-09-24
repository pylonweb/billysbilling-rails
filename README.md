# billysbilling-rails

A Ruby wrapper for the [Billys Billing API](https://dev.billysbilling.dk/api). Se also the homepage of [Billys Billing ](https://billysbilling.dk/)

READ BILLYS BILLING API TERMS BEFORE USE: https://dev.billysbilling.dk/api-terms

## Installation

Add this line to your application's Gemfile:

    gem 'billysbilling-rails'


Or install it yourself as:

    $ gem install billysbilling-rails
   
## Configuration

Simply supply your Billys Billing API key in an initializer

    BillysBilling.configure do |config|
    	config.api_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    end
    
Now you can fetch data from Billys Billing by querying the BillysBilling class directly

	BillysBilling.index_invoices # Returns all invoices
	
	BillysBilling.show_invoice({invoiceID}) # Returns the invoice with the specified id.
	
Or you can instantiate your own instance of the class with the API_KEY set automatically

	client = BillysBilling.new
	
\- **OR** -


If you for some reason need multiple instances of the client and do not want to have a default API_KEY you can specify the key when instantiating:

	client1 = BillysBilling.new(:api_key => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
	client2 = BillysBilling.new(:api_key => "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY")
	
## Usage Examples

client = BillysBilling.new(api_key: 'abcdefghijklmnopqrstuvxyz123456789')

product_params = {
    "name" => "Book",
    "description" => "Very exciting story.",
    "accountId" => "1681536-NjAl5urzeTSK",
    "vatModelId"=> "1681513-RKyYI1GPOdZJ",
    "productType"=> "product",
    "productNo"=> "B291",
    "suppliersProductNo"=> "S9322",
    "prices"=> [
        {
            "currencyId"=> "DKK",
            "unitPrice"=> 299
        }
    ]
}

product = client.create_product(product_params)

product.description

 #=> "Very exciting story."


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
