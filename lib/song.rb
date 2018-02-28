require "pry"
class Song
  attr_accessor :artist, :name
  def initialize(name)
    @name=name
  end

  def self.new_by_filename(filename)
    parse = filename.split(" - ")
    song = self.new(parse[1])
    song.artist = Artist.find_or_create_by_name(parse[0])
    binding.pry
    song.artist.add_song(song)

    song
  end

end
