module Giftrocket
  class Gift

    include HTTParty
    base_uri "#{Giftrocket.config[:base_api_uri]}gifts/"

    attr_accessor :id, :order_id, :amount, :message, :style_id, :status, :recipient, :events

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.id = attributes[:id]
      self.order_id = attributes[:order_id]
      self.amount = attributes[:amount]
      self.message = attributes[:message]
      self.style_id = attributes[:style_id]
      self.status = attributes[:status]
      self.recipient = attributes[:recipient]
      self.events = attributes[:events]
    end

    def self.list
      response = get '/', query: Giftrocket.default_options, format: 'json'
      if response.success?
        response_json = JSON.parse(response.body).with_indifferent_access
        response_json[:gifts].map do |gift_attributes|
          ::Giftrocket::Gift.new(gift_attributes)
        end
      else
        raise Giftrocket::Error.new(response)
      end
    end

    def self.retrieve(id)
      response = get "/#{id}", query: Giftrocket.default_options, format: 'json'
      if response.success?
        response_json = JSON.parse(response.body).with_indifferent_access
        ::Giftrocket::Gift.new(response_json[:gift])
      else
        raise Giftrocket::Error.new(response)
      end
    end
  end
end
