module Giftrocket
  class Order

    include HTTParty
    base_uri "#{Giftrocket.config[:base_api_uri]}orders/"

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

      response = post '/', body: data_to_post.to_json, headers: { 'Content-Type' => 'application/json' }
      if response.success?
        response_json = JSON.parse(response.body).with_indifferent_access
        Giftrocket::Order.new(response_json[:order])
      else
        raise Giftrocket::Error.new(response)
      end
    end

    def self.list
      response = get '/', query: Giftrocket.default_options, format: 'json'
      if response.success?
        response_json = JSON.parse(response.body).with_indifferent_access
        response_json[:orders].map do |order_attributes|
          Giftrocket::Order.new(order_attributes)
        end
      else
        raise Giftrocket::Error.new(response)
      end
    end

    def self.retrieve(id)
      response = get "/#{id}", query: Giftrocket.default_options, format: 'json'
      if response.success?
        response_json = JSON.parse(response.body).with_indifferent_access
        Giftrocket::Order.new(response_json[:order])
      else
        raise Giftrocket::Error.new(response)
      end
    end
  end
end
