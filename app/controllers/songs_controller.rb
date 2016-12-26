
class SongController < ApplicationController
  enable :sessions

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:song][:name])
    if params[:song][:artist_name] != ""
      @artist = Artist.find_or_create_by(name: params[:song][:artist_name])
      @song.artist = @artist
    end
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    @slug = @song.slug
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@slug}"
  end

  get "/songs/:id/edit" do
    # binding.pry
    @slug = params[:id]
    @song = Song.find_by_slug(@slug)
    erb :"songs/edit"
  end

  patch '/songs/:id' do
    @slug = params[:id]
    @song = Song.find_by_slug(@slug)
    if params[:song][:artist_name] != ""
      @artist = Artist.find_or_create_by(name: params[:song][:artist_name])
      @song.update(artist_id: @artist.id)
    end

    if params[:song][:genre_ids] != ""
      @song.update(genre_ids: params[:song][:genre_ids])
    end
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@slug}"
  end

  get '/songs/:id' do
    # binding.pry
    @slug = params[:id]
    @song = Song.find_by_slug(@slug)
    erb :"songs/show"
  end
end
