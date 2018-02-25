require 'pry'

class MP3Importer


attr_reader  :path


  def initialize(path)
    @path = path
  end






  def files
    files = []
    Dir.foreach(path) {|file|
      next if file == '.' or file == '..'
      files << file
    }

    files
  end


  def import
    files.each{ |file| Song.new_by_filename(file) }
  
  end

end
