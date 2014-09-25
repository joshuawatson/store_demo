class AdminProduct < Upmin::AdminModel
  attributes :name, :short_desc, :price, :manufacturer, :free_shipping

  actions :update_retail_price


  def update_retail_price(new_price)
    model.retail_price = new_price
    model.save!
  end

end
