# require "spec_helper"
# 
# describe BillysBilling::Invoice do
#   describe "#list" do
#     it "should be success" do
#       response = BillysBilling::Invoice.list()
#       response["success"].should be_true
#     end
#     it "should include an array named 'invoices'" do
#       response = BillysBilling::Invoice.list()
#       response["invoices"].should be_an_instance_of(Array)
#     end
#   end
#   
#   describe "#list with specific contact" do
#     it "should be success" do
#       response = BillysBilling::Invoice.list('1172167-iYZ2zDSyM3ib')
#       response["success"].should be_true
#     end
#     
#     it "should include an array named 'invoices'" do
#       response = BillysBilling::Invoice.list('1172167-iYZ2zDSyM3ib')
#       response["invoices"].should be_an_instance_of(Array)
#     end
#   end
#   
#   describe "#get" do
#     it "should return with success" do
#       if iid = get_invoice_id
#         response = BillysBilling::Invoice.get(iid)
#         response["success"].should be_true
#       end
#     end
#   end
# end