require 'json'

namespace :seed_data do

  task products: :environment do
    file = File.new("#{Rails.root}/products.json")
    json_array = JSON.parse(File.read(file))

    json_array.each_with_index do |json_product, index|
      break if index >= 100

      Product.create!(
        name: json_product["name"],
        short_desc: json_product["shortDescription"],
        best_selling_rank: json_product["bestSellingRank"],
        thumbnail: json_product["thumbnailImage"],
        price: json_product["salePrice"],
        manufacturer: json_product["manufacturer"],
        url: json_product["url"],
        product_type: json_product["type"],
        image: json_product["image"],
        category: json_product["category"],
        free_shipping: !json_product["shipping"].nil?
      )
    end
  end

  task users: :environment do
    file = File.new("#{Rails.root}/names.json")
    json_names = JSON.parse(File.read(file))
    first_names = json_names["first_names"]
    last_names = json_names["last_names"]
    (1..100).each do |i|
      first_name = first_names[rand(first_names.length)]
      last_name = last_names[rand(last_names.length)]
      if i % 3 == 0
        email = "#{first_name[0]}.#{last_name}#{i % 100}@gmail.com"
      elsif i % 3 == 1
        email = "#{first_name}.#{last_name}@gmail.com"
      else
        email = "#{first_name}#{last_name}@yahoo.com"
      end

      u = User.new(
        name: "#{first_name} #{last_name}",
        email: email,
        stripe_card_id: rand(2000000)
      )
      u.save!
    end
  end

  task orders: :environment do
    (1..200).each do |i|
      user = User.find(rand(User.count) + 1)
      order = Order.create!(user: user)
      num_products = rand(4) + 1
      (1..num_products).each do |k|
        quantity = rand(4) + 1
        product = Product.find(rand(Product.count) + 1)
        po = ProductOrder.new(
          order: order,
          product: product,
          quantity: quantity,
          purchase_price: product.price
        )
        po.save!
      end
      order.shipments.new(
        price: (rand(1000) / 100.0) + 10.0,
        carrier: [:ups, :usps, :fedex, :dhl][rand(4)],
        delivered: [true, true, false][rand(3)],
        est_delivery_date: [5.days.from_now, 1.days.from_now, 10.days.ago, 7.days.ago][rand(4)]
      ).save!
    end


  end

end
