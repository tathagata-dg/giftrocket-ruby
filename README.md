# GiftRocket Ruby API

Client library for [GiftRocket API](https://www.giftrocket.com/docs).
For more info about the product, or to get an access token, visit [GiftRocket Rewards](https://www.giftrocket.com/rewards).

Usage
-----

1) Require and configure the gem with your access token.

```
require 'giftrocket'
Giftrocket.configure do |config|
  config[:access_token] = 'YOUR_ACCESS_TOKEN'
end
```

2) Create an order

```
funding_source_id = Giftrocket::FundingSource.list.first.id
gift_data = [
  {
    "amount": 30,
    "message": "Thank you for your incredible work this year!",
    "recipient": {
      "email": "denise@sales.com",
      "name": "Denise Miller"
    },
    "style_id": "S0Y9RLCM26K2"
  }
]

# This creates the order with the funding source provided.
order = GiftRocket::Order.create!(funding_source_id, gift_data)
```

3) Look at the gifts you have sent in the past.

`Giftrocket::Gift.list`

If you have questions, open an issue or email api@giftrocket.com
