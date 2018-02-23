require "pry"
class Song
  attr_accessor :name
  attr_reader :artist_name, :artist
  
  def initialize(name)
    @name = name
  end
  
  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
    @artist.songs << self
  end
  
  def artist=(artist)
    @artist = artist
  end
    
  def self.new_by_filename(file)
    filearray = file.split(" - ")
    song = Song.new(filearray[1])
    song.artist_name = filearray[0]
    song
    #binding.pry
  end
  
end