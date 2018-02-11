class Room
  attr_reader :room_name, :entry_fee, :guests, :songs
  def initialize(room_name, entry_fee)
    @room_name = room_name
    @entry_fee = entry_fee
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

  def matches_title(song)
    if @songs.include?(song)
      return "Whoo"
    else
      return "Try another room"
    end
  end
end
