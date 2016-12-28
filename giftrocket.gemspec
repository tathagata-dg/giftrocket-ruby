# encoding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'giftrocket'
  spec.version       = '0.0.1'
  spec.summary       = 'GiftRocket Ruby API SDK'
  spec.licenses      = ['MIT']
  spec.homepage      = 'https://github.com/GiftRocket/giftrocket-ruby'
  spec.summary       = 'GiftRocket Ruby API SDK'
  spec.authors       = ['GiftRocket']
  spec.email         = ['support@giftrocket.com', 'kapil@giftrocket.com']
  spec.files         = Dir['lib/**/*.rb']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'httparty'

  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'mocha', '~> 1.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'simplecov', '~> 0.10'
  spec.add_development_dependency 'webmock', '~> 1.20'
  spec.add_development_dependency 'byebug'

end
