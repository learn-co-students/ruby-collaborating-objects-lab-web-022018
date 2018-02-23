require 'pry'

class Artist

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  attr_accessor :name, :songs

  def self.find_or_create_by_name(name)
    if found = all.detect {|x| x.name == name}
      found
    else
      new(name)
    end
  end

  def add_song(song)
    self.songs << song
  end

  def print_songs
    self.songs.each {|x| puts x.name}
  end

end
