require('minitest/autorun')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestGuest < MiniTest::Test

  def setup
    guest = ["Oli", "Ali", "Jane"]
    @room = Room.new("Room 1", 10)
    @room2 = Room.new("Room 2", 20)
    @room3 = Room.new("Room 3", 15)
    @rooms = [@room, @room2, @room3]
    @guest = Guest.new(guest[0], 10, "Summer nights")
    @guest1 = Guest.new("Jane", 30, "Sweet Caroline")
    @guest2 = Guest.new("Ali", 40, "Love Shack")
    @guest3 = Guest.new("Mike", 20, "Hey Jude")
    @guest4 = Guest.new("Jack", 25, "Baby got back")
    @guest5 = Guest.new("Anna", 35, "I will survive")
    @guest6 = Guest.new("Sarah", 45, "Dancing queen")
    @song1 = Song.new("Hey Jude")
    @song2 = Song.new("Sweet Caroline")
    @song3 = Song.new("I will survive")
    @songs = [@song1, @song2, @song3]

  end

  def test_room_has_name
    assert_equal("Room 1", @room.room_name)
  end

  def test_room_has_entry_fee
    assert_equal(10, @room.entry_fee)
  end

  def test_adding_guest
    @rooms[0].add_guest(@guest)
    assert_equal("Oli", @rooms[0].guests()[0].name())
  end

  def test_removing_guest
    @rooms[0].add_guest(@guest1)
    @rooms[0].add_guest(@guest2)
    guest_left = @rooms[0].remove_guest(@guest1)
    assert_equal("Jane", guest_left.name)
  end

  def test_removing_guest__count
    @rooms[0].add_guest(@guest1)
    @rooms[0].add_guest(@guest2)
    guest_left = @rooms[0].remove_guest(@guest1)
    assert_equal(1, @rooms[0].guests.length)
  end

  def test_add_songs_to_room
    @rooms[0].add_songs(@song2)
    assert_equal("Sweet Caroline", @rooms[0].songs()[0].title())
    assert_equal(1, @rooms[0].songs.length)
  end

  def test_too_many_guests
    @rooms[0].add_guest(@guest1)
    @rooms[0].add_guest(@guest2)
    @rooms[0].add_guest(@guest3)
    @rooms[0].add_guest(@guest4)
    @rooms[0].add_guest(@guest5)
    @rooms[0].add_guest(@guest6)
    assert_equal(true, @rooms[0].too_many_guests?())
  end

  def test_too_many_guests__five
    @rooms[0].add_guest(@guest1)
    @rooms[0].add_guest(@guest2)
    @rooms[0].add_guest(@guest3)
    @rooms[0].add_guest(@guest4)
    @rooms[0].add_guest(@guest5)
    assert_equal(false, @rooms[0].too_many_guests?())
  end

  def test_guests_favorite_song
    @rooms[0].add_songs(@song1)
    @rooms[0].add_songs(@song2)
    @rooms[0].add_songs(@song3)
    assert_equal(3, @rooms[0].songs.length)
    assert_equal("Whoo", @rooms[0].matches_title(@songs))
  end

end
