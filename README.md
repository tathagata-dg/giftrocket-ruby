# GiftRocket Ruby API

- [Documentation](https://www.giftrocket.com/docs)
- [Product information](https://www.giftrocket.com/rewards)
- [Get an API Key](https://www.giftrocket.com/rewards/auth/signup)

Installation
------------

`$ gem install 'giftrocket_ruby'`

or, add to your Gemfile

```ruby
source 'https://rubygems.org'
gem 'giftrocket_ruby'
```

Usage
-----

```ruby
require 'giftrocket'

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

# An array data representing the gifts you'd like to send.
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

Contributing
------------
The gem is maintained by GiftRocket engineers, but all are welcome to contribute.
Feel free to open an issue, submit a PR, or post a question.
