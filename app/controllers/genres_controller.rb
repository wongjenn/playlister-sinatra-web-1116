class GenreController < ApplicationController
  get "/genres" do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/genres/:id' do
    @slug = params[:id]
    @genre = Genre.find_by_slug(@slug)
    erb :"genres/show"
  end
end
