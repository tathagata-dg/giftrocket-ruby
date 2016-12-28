# GiftRocket Ruby API

Client library for [GiftRocket API](https://www.giftrocket.com/docs).
For more info about the product, or to get an access token, visit [GiftRocket Rewards](https://www.giftrocket.com/rewards).

Usage
-----

1. Require and configure the gem with your access token.

```
require 'giftrocket'
Giftrocket.configure do |config|
  config.access_token = 'YOUR_ACCESS_TOKEN'
end
```
