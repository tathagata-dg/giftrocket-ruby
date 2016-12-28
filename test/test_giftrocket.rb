require 'minitest/autorun'
require 'giftrocket'


class GiftrocketTest < Minitest::Test
  def test_config
    access_token = 'abcdefg'
    Giftrocket.configure do |config|
      config[:access_token] = access_token
    end
    assert_equal Giftrocket.class_variable_get('@@config')[:access_token], access_token
  end
end
