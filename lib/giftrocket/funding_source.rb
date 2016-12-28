module Giftrocket
  class FundingSource

    include HTTParty
    base_uri "#{::Giftrocket::API_URI}/funding_sources"

    attr_accessor :id, :method, :meta

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.meta = attributes[:id]
      self.meta = attributes[:method]
      self.meta = attributes[:meta]
    end

    def self.all
      response = get '/', query: ::BASE_OPTIONS

      if response.success?
        response.map do |funding_souce_attributes|
          ::GiftRocket::FundingSource.new(funding_souce_attributes)
        end
      else
        raise GiftRocket::Error.new(response)
      end
    end
  end
end
