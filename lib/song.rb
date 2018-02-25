class Song

  attr_accessor :name, :artist


  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


  def self.new_by_filename(file_name)
      song = self.new(file_name.split(" - ")[1])
      song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
      song.artist.songs << self
      song
  end




end
