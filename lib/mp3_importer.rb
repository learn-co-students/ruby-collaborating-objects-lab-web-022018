class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    path = @path + "/*.mp3"
    files = Dir.glob(path)
    files.map do |file|
       file.split("mp3s/")[1]
    end
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
"Real Estate - It's Real - hip-hop.mp3"
