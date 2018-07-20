require 'helper'

class TestConfig < Minitest::Test

  def test_get_hotexrc
    path = File.expand_path '../../fixtures/hotexrc', __FILE__
    access_key, secret_key = HotexAPI::Config.get_hotexrc(path)
    assert_equal 'access1234567', access_key
    assert_equal 'secret1234567', secret_key
  end

end
