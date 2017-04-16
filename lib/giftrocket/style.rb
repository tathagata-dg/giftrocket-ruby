module Giftrocket
  class Style

    attr_accessor :id, :card

    def initialize(attributes)
      attributes = attributes.with_indifferent_access
      self.id = attributes[:id]
      self.card = attributes[:card]
    end

    def url
      card && card[:url]
    end

    def self.list(filters={})
      options = filters.merge(Giftrocket.default_options)
      response = Giftrocket::Request.get 'styles',
                                     query: options,
                                     format: 'json'

      response[:styles].map do |style_attributes|
        Giftrocket::Style.new(style_attributes)
      end
    end
  end
end
