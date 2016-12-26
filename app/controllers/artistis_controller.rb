class ArtistController < ApplicationController

  get "/artists" do
    @artists = Artist.all
    erb :"artists/index"
  end

  get '/artists/:id' do
    @slug = params[:id]
    @artist = Artist.find_by_slug(@slug)
    erb :"artists/show"
  end
end
