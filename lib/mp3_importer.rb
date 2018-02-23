
require 'pry'
class MP3Importer
  attr_accessor :path, :artist

  def initialize(path)
    @path = path
  end

  def files
    Dir[path + "**/*.mp3"].map do |song|
      song_array = song.partition("mp3s/")[2]
    end
  end

  def import
    files.collect do |song|
      Song.new_by_filename(song)
    end
  end

end
