require "spec_helper"

describe BillysBilling::Invoice do
  it "invoice#index" do
    # puts BillysBilling.index_products
    # puts BillysBilling.index_vat_models.first
    # puts BillysBilling.index_accounts.first
    
    params = {
        "name" => "Book",
        "description" => "Very exciting story.",
        "accountId" => "1681817-d2rh5fGoC3yt",
        "vatModelId"=> "1681794-R01nOyyaKE9o",
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
    

    puts BillysBilling.create_products(params)
  end
end