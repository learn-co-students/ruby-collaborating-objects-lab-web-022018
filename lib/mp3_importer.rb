class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files

    @files = Dir.glob(path+"/*.mp3").map{ |file| file = file.split(path+"/")[1] }
  end

  def import
    files.each{|file| Song.new_by_filename(file)}
  end
end
