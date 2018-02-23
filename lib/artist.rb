class Artist

  @@all = [] # #4. save --> adds the artist instance to the @@all class var

  attr_accessor :name #2. sets &gets name for artist (name=)
#
  def initialize(name) # 1. #initialize with #name accepts name for artist
    @name = name  # 1. initialize with #name accepts name for artist
    @songs = [] # #3. songs keeps track of artist's songs
  end

  def songs # #3. songs keeps track of artist's songs names
    @songs
  end

  def add_song(song) #3.  #songs keeps track of artist's songs (instances)
    @songs << song
  end

  def save  #4. save --> adds the artist instance to the @@all class var
    @@all << self
    self
  end

  def self.all  #4. save --> adds the artist instance to the @@all class var
    @@all
  end

  def self.find_or_create_by_name(name) #finds or creates an artist by name maintaining uniqueness of objects by name property
    self.find(name) ? self.find(name) : self.create(name)
    #if can find artist name, return the name, if not, create new instance
  end

  def self.find(name) #Artist.find(name)
    self.all.find {|artist| artist.name == name}
    #Artist.all.find --> returns if name input = artist instance's name
  end

  def self.create(name) #Artist.create(name)
    self.new(name).tap {|artist| artist.save} #Artist.new(name)
    #.tap returns the new song instance, saves artist
  end

  def print_songs
    songs.each {|song| puts song.name}
    #song.name refers to song instance.name
  end
end
