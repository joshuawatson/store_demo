# Store Demo for Upmin

This is a sample application designed to help demo [upmin-admin](https://github.com/upmin/upmin-admin-ruby). Below is a basic outline of how to set up the application and get seed data for the demo. All product seed data is taken from the [Best Buy Developer API](https://developer.bestbuy.com/), and users are generated using common first and last names and randomly pairing them.

## Bundle install

First you need to bundle install. This is pretty straighforward - in your terminal type:

```
bundle install
```

## Create, migrate, and seed the DB

The store demo uses sqlite by default, so you should be able to create and seed the database relatively easily.

```
bundle exec rake db:create db:migrate seed_data:products seed_data:users seed_data:orders
```

**NOTE** The seed data calls must be made in this order, as the orders seed function requires both users and products to exist.
