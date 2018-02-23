require 'pry'
require 'mp3_importer.rb'
require 'artist.rb'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    song = self.new(file_name)
    song.name = file_name.split(" - ")[1]
    # artist_name = file_name.split(" - ")[0]
    song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song.artist.add_song(song)
    song
  end


end
