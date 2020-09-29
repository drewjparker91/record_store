require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

# def sort_album
#   @albums = Album.sort
# end

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

post('/albums') do
  name = params[:album_name]
  artist = params[:album_artist]
  year = params[:album_year]
  genre = params[:album_genre]
  album = Album.new(name, nil, artist, year, genre)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  name = params[:name]
  artist = params[:artist]
  year = params[:year]
  genre = params[:genre]
  @album.name_update(name)
  @album.artist_update(artist)
  @album.year_update(year)
  @album.genre_update(genre)
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

get('/search') do
  @albums = Album.search(params[:search])
  erb(:search)
end  



# do we need to sort the albums? (Album.sort) and  add to "get('/') do" 

# def album_sort
#   @albums = album.sort
# end

# get('/search') do
#   album_sort
#   @albums = Album.search
#end
