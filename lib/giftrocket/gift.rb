module Giftrocket
  class Gift

    attr_accessor :id, :order_id, :amount, :message, :style_id, :status, :recipient, :events

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.id = attributes[:id]
      self.order_id = attributes[:order_id]
      self.amount = attributes[:amount]
      self.message = attributes[:message]
      self.style_id = attributes[:style_id]
      self.status = attributes[:status]
      self.recipient = Giftrocket::User.new(attributes[:recipient])
      self.events = attributes[:events]
    end

    def self.list(query={})
      query = query.merge(Giftrocket.default_options)
      response = Giftrocket::Request.get 'gifts',
                                         query: query,
                                         format: 'json'
      response[:gifts].map do |gift_attributes|
        Giftrocket::Gift.new(gift_attributes)
      end
    end

    def self.retrieve(id)
      response = Giftrocket::Request.get "gifts/#{id}",
                                         query: Giftrocket.default_options,
                                         format: 'json'
      Giftrocket::Gift.new(response[:gift])
    end
  end
end
