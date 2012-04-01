require "spec_helper"

describe BillysBilling::Invoice do
  it "should print some crap" do
    
    BillysBilling.api_key = "OC9HNHdg3d5HF8cvTYMgtBoi53igPMuC"
    # 
    BillysBilling::Invoice.list("1172167-iYZ2zDSyM3ib")
  end
end