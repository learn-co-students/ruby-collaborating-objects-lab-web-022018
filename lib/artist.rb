require 'pry'

class Artist
	attr_accessor :name, :songs

	@@all = []

	def initialize(artist_name)
		@name = artist_name
		@songs = []
	end

	def self.all

		@@all
	end

	def save
		@@all << self
	end

	def self.create_by_name(artist_name)
		artist = self.new(artist_name)
		artist.save
		artist
	end

	

	def self.find_by_name(artist_name)
		@@all.find {|artist| artist.name == artist_name}

	end

	def self.find_or_create_by_name(artist_name)
		artist = self.find_by_name(artist_name)
		if !artist
			artist = self.create_by_name(artist_name)
		end
		artist
	end

	def print_songs
		@songs.each {|song| puts song.name}
	end

	def add_song(song)
		@songs << song
	end

end
