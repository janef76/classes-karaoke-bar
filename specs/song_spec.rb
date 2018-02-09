require('minitest/autorun')
require_relative('../song')

class TestSong < MiniTest::Test
  def setup
    @song = Song.new("I will survive")
  end

  def test_song_has_name
    assert_equal("I will survive", @song.title)
  end

end
