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

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to '/recipes/#{@recipe.id}'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(:id)
    erb :show
  end

  get 'recipes/:id/edit' do 
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


end
