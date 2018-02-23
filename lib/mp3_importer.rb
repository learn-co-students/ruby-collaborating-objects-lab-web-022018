require "pry"

class MP3Importer
  attr_accessor :path
  
  def initialize(directory)
    @path = directory
  end
  
  def files
    #Dir.chdir(@path)
    out = Dir["#{@path}/*.mp3"]
    #out = Dir.glob("*")
    out = out.collect{|song| song.split("/").last}
  end
  
  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
  
end

#d = "db/mp3s"
#d = "./spec/fixtures/mp3s"
#test = MP3Importer.new(d)
#test.files