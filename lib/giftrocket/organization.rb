module Giftrocket
  class Organization

    attr_accessor :id, :name, :website, :phone, :created_at, :config

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.id = attributes[:id]
      self.name = attributes[:name]
      self.website = attributes[:website]
      self.phone = attributes[:phone]
      self.config = attributes[:config]
      self.created_at = attributes[:created_at]
    end

    def self.create!(data)
      response = Giftrocket::Request.post(
        'organizations',
        body: data.merge(Giftrocket.default_options).to_json,
        headers: { 'Content-Type' => 'application/json' }
      )

      Giftrocket::Organization.new(response[:organization])
    end

    def self.list
      Giftrocket::Request.get(
        'organizations',
        query: Giftrocket.default_options,
        format: 'json'
      )[:organizations].map do |org|
        Giftrocket::Organization.new(org)
      end
    end
  end
end
