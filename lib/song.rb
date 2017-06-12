require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    name_song_genre = file_name.split(".").first.split(" - ")

    new_song = self.new(name_song_genre[1])
    new_artist = Artist.find_or_create_by_name(name_song_genre[0])
    new_artist.add_song(new_song)
    new_artist.save
    new_song
  end

end
