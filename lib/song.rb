
class Song
  attr_accessor :name, :artist # name= & artist= sets

  def initialize(name) #initialize with name
    @name = name
  end
#
  def self.new_by_filename(filename) #Song.new_by_filename(filename)
    artist = filename.split(" - ")[0]
    song = filename.split(" - ")[1]
    new_song = self.new(song) # Song.new(song) creates new song instance
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)

    #Song.artist == Artist.name --> sets Song.artist = to artist instance.name
  end

end
