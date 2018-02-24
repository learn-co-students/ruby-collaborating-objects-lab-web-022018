class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
    Dir["#{@path}/*.mp3"].each {|file| @files << File.basename(file)}
  end

  def import
    @files.each {|filename| Song.new_by_filename(filename)}
  end

end
