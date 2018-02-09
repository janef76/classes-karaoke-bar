class Room
  attr_reader :room_name, :guests, :songs
  def initialize(room_name)
    @room_name = room_name
    @guests = []
    @songs = []
  end

  def add_guest(guest)
    @guests << guest
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def add_songs(title)
    @songs << title
  end

  def too_many_guests?()
      if @guests.length > 5
        return true
      else
        return false
      end
  end
end
