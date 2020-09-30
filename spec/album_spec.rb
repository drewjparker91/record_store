require 'rspec'
require 'album'

describe '#Album' do
  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", nil, nil, nil, nil) # nil added as second argument
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil) # nil added as second argument
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", nil, nil, nil, nil)
      album2 = Album.new("Blue", nil, nil, nil, nil)
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", nil, nil, nil, nil)
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", nil, nil, nil, nil)
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#name_update') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", nil, nil, nil, nil)
      album.save()
      album.name_update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil, nil, nil, nil)
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('.search') do
    it('matches an album to the inputted album in the search form')do
      album = Album.new("Red", nil, nil, nil, nil)
      album.save()
      album2 = Album.new("Blue", nil, nil, nil, nil)
      album2.save()
      album3 = Album.new("Stankonia", nil, nil, nil, nil)
      album3.save()
      expect(Album.search('Stankonia')).to(eq(album))
    end
  end

  # describe('.sort') do
  #   it('sorts albums by the value name') do
  #   album = Album.new("Giant Steps", 1, nil, nil, nil)
  #   album.save()
  #   album2 = Album.new("Blue", 2, nil, nil, nil)
  #   album2.save()
  #   expect(Album.all).to(eq([album, album2]))
  #   expect(Album.sort).to(eq([album, album2]))
  #   end
  # end
    
end