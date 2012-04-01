require "spec_helper"

describe BillysBilling::Invoice do
  it "should print some crap" do
    
    BillysBilling.api_key = "OC9HNHdg3d5HF8cvTYMgtBoi53igPMuC"
    # 
    BillysBilling::Invoice.list
  end
end