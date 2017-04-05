module Giftrocket
  class Order

    attr_accessor :id, :gifts, :payment, :sender

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.id = attributes[:id]
      self.gifts = attributes[:gifts].map do |gift_attributes|
        Gift.new(gift_attributes)
      end

      self.payment = Giftrocket::Payment.new(attributes[:payment])
      self.sender = Giftrocket::User.new(attributes[:sender])
    end

    def self.create!(funding_source_id, gifts_data_array)
      data_to_post = {
        funding_source_id: funding_source_id,
        gifts: gifts_data_array
      }.merge(Giftrocket.default_options)

      response = Giftrocket::Request.post 'orders',
                                          body: data_to_post.to_json,
                                          headers: { 'Content-Type' => 'application/json' }

      Giftrocket::Order.new(response[:order])
    end

    def self.list
      response = Giftrocket::Request.get 'orders',
                                         query: Giftrocket.default_options,
                                         format: 'json'

      response[:orders].map do |order_attributes|
        Giftrocket::Order.new(order_attributes)
      end
    end

    def self.retrieve(id)
      response = Giftrocket::Request.get "orders/#{id}",
                                         query: Giftrocket.default_options,
                                         format: 'json'

      Giftrocket::Order.new(response[:order])
    end
  end
end
