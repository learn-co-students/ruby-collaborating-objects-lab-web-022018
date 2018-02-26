class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    temp = nil
    self.all.each {|artist| temp = artist if artist.name == name }
    temp
  end


  def self.create(name)
    artist = self.new(name)
    artist.save
  end

  def save
    @@all << self
    self
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
end
