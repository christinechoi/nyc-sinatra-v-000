class FiguresController < ApplicationController


  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do 

    erb :'/figures/new'
  end 

  post '/figures/new' do 
    #binding.pry
    @figure = Figure.create(params[:figure])
    #binding.pry
    @figure.titles << Title.find_or_create_by(params[:title_ids])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark_ids])
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do 


  end



end
