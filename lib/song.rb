require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new.save
    self.all.last
  end

  def self.new_by_name(song_string)
    song = Song.new
    song.name = song_string
    song
  end

  def self.create_by_name(song_string)
    song = Song.new
    song.name = song_string
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song| 
     if song.name == name
      song
     end
    end 
  end

  def self.find_or_create_by_name(name)
    find_by = self.find_by_name(name)
    if find_by 
      find_by
    else
      self.create_by_name(name) 
    end
  end

  def self.alphabetical
    alphabetical = []
    alphabetical = self.all.sort_by do |song|
     song.name
    end
    alphabetical
  end

  def self.new_from_filename(filename)
   
    song_and_artist_name = filename.split("-")
    song = Song.new
    name = song_and_artist_name[1].chomp(".mp3").strip
    artist = song_and_artist_name[0].strip
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
 
end

