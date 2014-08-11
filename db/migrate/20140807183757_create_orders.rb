class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :stripe_charge_id


      t.timestamps
    end
  end
end
