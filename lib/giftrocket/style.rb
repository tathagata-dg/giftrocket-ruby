module Giftrocket
  class Style

    include HTTParty
    base_uri "#{Giftrocket.config[:base_api_uri]}styles/"

    attr_accessor :id, :card

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.id = attributes[:id]
      self.card = attributes[:card]
    end

    def url
      card && card[:url]
    end

    def self.list
      response = get '/', query: Giftrocket.default_options, format: 'json'
      if response.success?
        response_json = JSON.parse(response.body).with_indifferent_access
        response_json[:styles].map do |style_attributes|
          Giftrocket::Style.new(style_attributes)
        end
      else
        raise Giftrocket::Error.new(response)
      end
    end
  end
end
