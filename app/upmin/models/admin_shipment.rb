class AdminShipment < Upmin::Model

  actions :update_shipment

  def status
    # return Upmin::Widget::ProgressBar.new(model.status, model.tracking_states)
  end

  def user_args
    return [User]
  end

end
