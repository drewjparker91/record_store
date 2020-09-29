class Album
  attr_reader :id, :name, :artist,  :year, :genre

  @@albums = {} # our database of albums
  @@total_rows = 0

  def initialize(name, id, artist, year, genre)
    @name = name
    @id = id || @@total_rows += 1
    @artist = artist
    @year = year
    @genre = genre
  end

  #def self.sort

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.year, self.genre)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
    self.artist() == album_to_compare.artist()
    self.year() == album_to_compare.year()
    self.genre() == album_to_compare.genre()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def name_update(name)
    @name = name
  end

  def artist_update(artist)
    @artist = artist
  end

  def year_update(year)
    @year = year
  end

  def genre_update(genre)
    @genre = genre
  end
  

  def delete
    @@albums.delete(self.id)
  end

  def self.search(name)
    @@albums.values.select {|x| x.name == name}    
  end

#   def self.sort
#     array = @@albums.sort_by {|k,v| v.name}
#     array.to_h.values
#   end
# end

  # def self.search(name)
  #   @@albums.each_pair do |array|
  #     if name == array[1].name
  #       return array[1]
  #     end
  #   end 
  # end