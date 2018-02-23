require 'pry'

class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    list = Dir["#{path}/*"]
    list = list.map {|path| path.split("/")}
    list = list.map {|path| path.last}
  end


  def import
    self.files.each {|file| Song.new_by_filename(file)}
  end

end
