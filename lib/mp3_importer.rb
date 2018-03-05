class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{path}/*.mp3"].map { |f| File.basename(f) }
  end

  def self.import_song(filename)
    artist_name, song_name = filename.split(/ - |\./)
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.new(song_name)
    artist.add_song(song)
    song
  end

  def import
    files.each do |filename|
      self.class.import_song(filename)
    end
  end
end
