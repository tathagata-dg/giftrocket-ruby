require 'minitest/autorun'
require 'webmock/minitest'
require 'giftrocket'

class OrderTest < Minitest::Test
  def test_initialization
    data = {
      "id": "QABSTARTSFSIO",
      "gifts": [{
        "amount": 30,
        "events": {
          "created_at": "2016-11-05T01:00:49.387Z",
          "delivered_at": "2016-11-05T01:02:50.057Z"
        },
        "id": "KF2BL4KDR87M",
        "message": "Thank you for your incredible work this year!",
        "order_id": "QABSTARTSFSIO",
        "recipient": {
          "email": "denise@sales.com",
          "name": "Denise Miller"
        },
        "style_id": "S0Y9RLCM26K2",
        "status": "DELIVERED"
      }],
      "payment": {
        "amount": 30,
        "fees": 2,
        "total": 32,
        "funding_source_id": "LARFAF2423"
      },
      "sender": {
        "email": "james@sales.com",
        "name": "James Fields"
      }
    }.with_indifferent_access

    order = Giftrocket::Order.new(data)
    assert_equal data[:id], order.id
    assert order.gifts[0].is_a?(Giftrocket::Gift)
    assert_equal order.gifts[0].id, 'KF2BL4KDR87M'
    assert order.payment.is_a?(Giftrocket::Payment)
    assert_equal order.payment.funding_source_id, 'LARFAF2423'
    assert order.sender.is_a?(Giftrocket::User)
    assert_equal order.sender.name, "James Fields"
  end
end
