require_relative 'artist'

class Song

  @@all = []
  attr_reader :artist_name
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song_info = filename.chomp('.mp3').split(' - ')
    song = new(song_info[1])
    song.artist_name = song_info[0]
    @@all << self
    song
  end

  def artist_name=(name)
    @artist_name = name
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    self.artist = artist
  end


end
