class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song
    song.artist = self
  end

  def self.all
    @@all = @@all.uniq
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    find = self.all.find { |each_artist_instance| each_artist_instance.name == name }
    if find.nil?
      self.new(name)
    else
      find
    end
  end

  def print_songs
    self.songs.each { |song_instance| puts song_instance.name }
  end

end
