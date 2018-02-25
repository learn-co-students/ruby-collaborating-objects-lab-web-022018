class MP3Importer
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect do |x| x.gsub("#{path}/", "") end
  end
  
  def import
    files.each do |x| Song.new_by_filename(x) end
  end
  
end