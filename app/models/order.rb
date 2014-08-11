# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
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
    # This code is commented out for the demo, but shown
    # for clarify.
    # charge = Stripe::Charge.retrieve(stripe_charge_id)
    # refund = charge.refunds.create(amount: amount)
  end

  def refunded_amount
    # This code is commented out for the demo, but shown
    # for clarify.
    # charge = Stripe::Charge.retrieve(stripe_charge_id)
    # refunded_amount = charge.amount_refunded

    return total_cost / 2.0 # use this for the demo.
  end

end
