# GiftRocket Ruby API

Client library for [GiftRocket API](https://www.giftrocket.com/docs).
For more info about the product, or to get an access token, visit [GiftRocket Rewards](https://www.giftrocket.com/rewards).

Usage
-----

```
require "giftrocket"

# Development script.
ACCESS_TOKEN = 'YOUR_ACCESS_TOKEN_HERE'
Giftrocket.configure do |config|
  config[:access_token] = ACCESS_TOKEN
end

funding_sources = Giftrocket::FundingSource.list
styles = Giftrocket::Style.list
orders = Giftrocket::Order.list # blank at first.
gifts = Giftrocket::Gift.list # blank at first.

#
# Generate an order.
#

# The funding source you select is how you are charged for the order.
funding_source_id = funding_sources.first.id

# An array of gifts to create.
gifts_data = [
  {
    "amount": 30,
    "message": "Thanks for your help this year!",
    "style_id": styles.first.id,
    "recipient": {
      "email": "jake@giftrocket.com",
      "name": "Jake Douglas"
    }
  }
]

# Submit the order to GiftRocket. If response is 200, the order was placed.
order = Giftrocket::Order.create!(funding_source_id, gifts_data)

# Test that the order and gift were created.
Giftrocket::Order.retrieve(order.id)
Giftrocket::Gift.retrieve(order.gifts.first.id)
```
