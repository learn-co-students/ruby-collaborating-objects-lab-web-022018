class Song
attr_accessor :artist, :name
  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    data = file.split(" - ")
    song = Song.new(data[1])
    song.artist_name = data[0]
    song
  end

  def artist_name= (name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end
end
