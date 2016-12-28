module Giftrocket

  def self.configure
    yield :config
    @@config = config
  end

  # nothing here right now.
end
