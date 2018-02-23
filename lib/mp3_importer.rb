require "pry"

class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path)
    files.delete(".")
    files.delete("..")
    files
  end

  def import
    self.files.each do |song|
      song.split! " - "
    end
  end
end
