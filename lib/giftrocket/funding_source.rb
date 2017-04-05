module Giftrocket
  class FundingSource

    attr_accessor :id, :method, :meta

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.id = attributes[:id]
      self.method = attributes[:method]
      self.meta = attributes[:meta]
    end

    def self.list
      response = Giftrocket::Request.get 'funding_sources',
                                         query: Giftrocket.default_options,
                                         format: 'json'

      response[:funding_sources].map do |funding_souce_attributes|
        Giftrocket::FundingSource.new(funding_souce_attributes)
      end
    end
  end
end
