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

  upmin_actions :update_box

  def update_box(length, width, height, weight, perishable = false, &block)
    # Make sure args are cast correctly
    length = length.to_i
    width = width.to_i
    height = height.to_i
    weight = weight.to_f
    if perishable
      perishable = ["yes", "true"].include?(perishable.downcase)
    end

    # Fake work ...
    raise "Invalid weight: #{weight}" if weight <= 0
    raise "Perishable shipments require a manual order with <xxxxx>" if perishable

    if length > width && length > height
      return "Larger length!"
    elsif width > length && width > height
      return "Larger width!"
    else
      return "Larger height!"
    end

  end
end
