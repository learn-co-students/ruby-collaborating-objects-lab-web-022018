class Artist
attr_accessor :name
attr_reader :songs

@@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    if @@all.any? {|artist| artist.name == name}
      @@all.detect {|artist| artist.name == name}
    else
      artist = self.new(name)
      artist.name = name
      artist
    end
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

  def self.all
    @@all
  end

end
