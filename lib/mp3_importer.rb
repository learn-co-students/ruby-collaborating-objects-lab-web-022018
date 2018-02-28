require "pry"
class MP3Importer
  attr_accessor :path
  def initialize(filepath)
    @path=filepath
    @files=[]
  end

  def files
    Dir.entries(@path).reject {|x| x=="."||x==".."}
  end

  def import
    files.each {|file| Song.new_by_filename(file)}
  end
end
