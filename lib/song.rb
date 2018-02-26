require 'pry'

class Song
attr_accessor :name, :artist
  def initialize(name)
    @name = name
  end



  def artist_name= (name)
    @artist = Artist.find_or_create_by_name(name)
    @artist.add_song(self)

  end

  def self.new_by_filename(file)
    file.slice!(".mp3")
    file = file.split(" - ")
    creator = file[0]
    name = file[1]
    genre = file[2]
    song = Song.new(name)
    song.artist_name = creator
  
    song
  end


  end
