require('minitest/autorun')
require_relative('../guest')
require_relative('../room')

class TestGuest < MiniTest::Test
  def setup
    @room = Room.new("Room 1", 10)
    @room1 = Room.new("Room 2", 30)
    @guest = Guest.new("Jane", 20, "Don't stop believin")
  end

  def test_guest_has_name
    assert_equal("Jane", @guest.name)
  end

  def test_guest_has_money
    assert_equal(20, @guest.money)
  end

  def test_guests_fav_song
    assert_equal("Don't stop believin", @guest.song)
  end

  def test_guest_has_enough_money__true_if_enough
    assert_equal(true, @guest.enough_money?(@room))
  end

  def test_guest_has_enough_money__false_if_not_enough
    assert_equal(false, @guest.enough_money?(@room1))
  end

  def test_guest_can_pay_entry_fee__decreases_money
    @guest.pay_entry(@room)
    assert_equal(10, @guest.money)
  end
end
