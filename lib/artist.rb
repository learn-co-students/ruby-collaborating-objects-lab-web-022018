class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    return @@all
  end

  def self.find_or_create_by_name(name)
    if Artist.all.detect {|artist| artist.name == name}
      return Artist.all.detect {|artist| artist.name == name}
    else
      Artist.new(name)
    end
  end

  def save
    @@all << self
  end

end
