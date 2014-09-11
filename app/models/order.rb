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

  upmin_attribute :total_cost

  def total_cost
    return @total_cost if @total_cost

    @total_cost = 0.0
    product_orders.each do |product_order|
      @total_cost += product_order.quantity * product_order.purchase_price
    end
    @total_cost += shipment.price if shipment
    return @total_cost
  end

  def issue_refund(amount = total_cost)
    # This code is commented out because there isn't a stripe api key set, and real charges are not set for the demo. The code is still shown to demonstrate what should be happening in production.
    amount = BigDecimal.new(amount) if amount.is_a?(String)
    amount_cents = (amount * 100).to_i
    # charge = Stripe::Charge.retrieve(stripe_charge_id)
    # charge.refunds.create(amount: amount_cents)
    return amount
  end

  def create_return_shipping_label
    # Do some work to create a return label
    return "http://assets.geteasypost.com/postage_labels/labels/lUoagDx.png"
  end


end
