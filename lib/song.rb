require 'pry'

class Song

	attr_accessor :name, :artist

	def initialize(name)
		@name = name

	end




	def self.new_by_filename(filename)
		data = filename.split(' - ')
		song = Song.new(data[1])
		artist = Artist.find_or_create_by_name(data[0])
		artist.add_song(song)
		song.artist = artist
		puts song.name
		puts data.inspect
		puts '-'*10
		puts Artist.all
		song
	end

end