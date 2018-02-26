
require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find { |artist| artist.name == name }

    if artist == nil
      artist = Artist.new(name)
      artist.save
      artist
    else
      artist
    end

    # if @@all.include?(name) == false
    #   #if artist is not included, create
    #   #new instancd of artist in @@all
    #   #then output instance of artist
      # artist = Artist.new(name)
      # artist.save
      # artist
    #   #set artist variable in order to
    #   #return only instance of the artist
    # else
    #   #if included, then just output
    #   #instanc of artist
    #   @@all.find { |artist| artist.name == name }
    # end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def print_songs
    songs.each { |song| puts song.name }
  end

end
