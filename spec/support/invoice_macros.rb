module InvoiceMacros
  def get_invoice_id
    id = BillysBilling::Invoice.list()["invoices"].first["id"]
  end
end