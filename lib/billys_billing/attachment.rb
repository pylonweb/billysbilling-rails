module BillysBilling
  class Attachment < BillysBilling::Base
    attr_accessor :id, :filename, :download_url

    # belongs_to :invoice
    # belongs_to :daybook_transaction

  end
end