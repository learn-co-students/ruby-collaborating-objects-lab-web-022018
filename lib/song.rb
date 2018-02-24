class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    filename_array = filename.split(/[-.]/)
    song = self.new(filename_array[1].strip)
    artist = Artist.find_or_create_by_name(filename_array[0].strip)
    artist.add_song(song)
    song
  end

end
