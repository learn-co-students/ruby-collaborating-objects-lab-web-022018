class MP3Importer

	attr_reader :path, :mp3s

	def initialize(path)
		@path = path
	end

	def import
		files
		@mp3s.each {|mp3| Song.new_by_filename(mp3)}
	end

	def files
		file_list = Dir[@path + '/*.mp3']
		@mp3s = file_list.map do |file|
			title = file.split('/')[-1]
			title.slice('.mp3')
			title
		end
	end



end