require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test
  def setup
    @guest = Guest.new("Jane", 20)
  end

  def test_guest_has_name
    assert_equal("Jane", @guest.name)
  end

  def test_guest_has_money
    assert_equal(20, @guest.money)
  end
end
