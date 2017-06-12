require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).delete_if { |each_file| each_file.start_with?(".") }
  end

  def import
    list = self.files
    list.each do |each_song|
      Song.new_by_filename(each_song)
    end
  end

end
