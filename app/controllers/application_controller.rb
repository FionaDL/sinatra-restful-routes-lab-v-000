require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    binding.pry
    @recipe = Recipe.create(params)
    redirect to '/recipe/#{@recipe.id}'
  end

end
