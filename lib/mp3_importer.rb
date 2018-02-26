require 'pry'
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

def files
  song_directory = Dir[@path+"/*.mp3"].collect{|song| song }
  song_directory.each{|song| song.slice!(@path+"/")}
end

def import

  files.map do |song|
    Song.new_by_filename(song)
  end

end

end
