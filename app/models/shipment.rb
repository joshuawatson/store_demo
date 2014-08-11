# == Schema Information
#
# Table name: shipments
#
#  id                :integer          not null, primary key
#  order_id          :integer
#  price             :decimal(, )
#  carrier           :string(255)
#  delivered         :boolean
#  est_delivery_date :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

class Shipment < ActiveRecord::Base
  belongs_to :order
end
