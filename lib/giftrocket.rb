module Giftrocket

  def self.configure
    config = {}
    yield config
    @@config = config
  end
end
