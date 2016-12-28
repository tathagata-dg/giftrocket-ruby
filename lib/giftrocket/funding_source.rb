module Giftrocket
  class FundingSource

    include HTTParty
    base_uri "#{Giftrocket.config[:base_api_uri]}funding_sources/"

    attr_accessor :id, :method, :meta

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.id = attributes[:id]
      self.method = attributes[:method]
      self.meta = attributes[:meta]
    end

    def self.all
      response = get '/', query: Giftrocket.default_options, format: 'json'
      if response.success?
        response_json = JSON.parse(response.body).with_indifferent_access
        response_json[:funding_sources].map do |funding_souce_attributes|
          ::Giftrocket::FundingSource.new(funding_souce_attributes)
        end
      else
        raise Giftrocket::Error.new(response)
      end
    end
  end
end
