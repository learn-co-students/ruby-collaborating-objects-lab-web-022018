require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(name)
    @songs << name
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist_array = self.all.map {|artists| artists.name}
    if artist_array.include?(name)
      self.all.each do |artists|
        if artists.name == name
          artists.add_song(name)
          return artists
        end
      end
    else
      artist = self.new(name)
      artist.add_song(name)
      artist
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end






end
