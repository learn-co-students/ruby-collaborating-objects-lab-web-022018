
class Artist
  
  attr_accessor :name, :songs
  @@all = []
 
  
  def initialize(name)
    @name = name
    @songs = []   
  end
  
  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
  
  
  def name=(name)
    @name = name
  end
  
  def self.find_or_create_by_name(name)
    # if self.all.find{|artist| artist.name == name} == nil
    #   new_artist = Artist.new
    #   new_artist.name = name
    #   return new_artist
    # else
    #   return self.all.find{|artist| artist.name == name} 
    # end
    
    self.find(name) ? self.find(name) : self.create(name)
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end
  
  def add_song(song)
    @songs << song
    song.artist = self
  end
  
  def print_songs
    songs.each{
      |song|
      puts song.name
    }  
  end
end