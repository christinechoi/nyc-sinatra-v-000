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




end
