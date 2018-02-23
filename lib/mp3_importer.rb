require_relative 'song'

class MP3Importer

  def initialize(path)
    @path = path
  end

  attr_accessor :path

  def files
    Dir["#{path}/*.mp3"].map do |filename|
      filename.reverse.chomp("#{path}/".reverse).reverse
    end
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
