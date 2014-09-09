# == Schema Information
#
# Table name: shipments
#
#  id                :integer          not null, primary key
#  order_id          :integer
#  price             :decimal(, )
#  carrier           :string(255)
#  tracking_code     :string(255)
#  delivered         :boolean
#  est_delivery_date :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

class Shipment < ActiveRecord::Base
  belongs_to :order

  def cancel
    # Demo code showing what might happen here in production. No EP API Key is provided, so this is all fake.
    # ep_shipment = EasyPost::Shipment.retrieve(ep_shipment_id)
    # ep_shipment.refund
    return true
  end

  def update_shipment(length, width, height, weight, perishable = false)
    # Do some work - this is a demo so no work is done.
    return "Shipment successfully updated with the following: length=#{length}, width=#{width}, height=#{height}, weight=#{weight}, perishable=#{perishable}"
  end

end
