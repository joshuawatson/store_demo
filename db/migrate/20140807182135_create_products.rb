class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :short_desc
      t.integer :best_selling_rank
      t.string :thumbnail
      t.decimal :price
      t.string :manufacturer
      t.string :url
      t.string :product_type
      t.string :image
      t.string :category
      t.boolean :free_shipping

      t.timestamps
    end
  end
end
