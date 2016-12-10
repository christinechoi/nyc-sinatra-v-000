class LandmarksController < ApplicationController


  get '/landmarks' do 
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do 
    
    erb :'/landmarks/new'
  end

  post '/landmarks/new' do 
    @landmark = Landmark.create(params[:landmark])
    #binding.pry
    @landmark.save

    redirect '/landmarks/show'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    #binding.pry
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find(params[:id])

    @landmark.update(params[:landmark])

    redirect to("/landmarks/#{@landmark.id}") #need double quotes
     #or else get URI::InvalidURIError: bad URI(is not URI?)
  end




end
