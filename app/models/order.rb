# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  stripe_charge_id :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Order < ActiveRecord::Base
  has_many :product_orders
  has_many :products, through: :product_orders
  has_one :shipment
  belongs_to :user

  def total_cost
    return @total_cost if @total_cost

    @total_cost = 0.0
    product_orders.each do |product_order|
      @total_cost += product_order.quantity * product_order.purchase_price
    end
    @total_cost += shipment.price
    return @total_cost
  end

  def refund!(amount = total_cost)
    charge = Stripe::Charge.retrieve(stripe_charge_id)
    charge.refunds.create(amount: amount)
    return amount
  end


end
