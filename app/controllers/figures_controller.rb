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
    
    if !params["figure"]["name"].empty?
      @figure.titles << Title.create(name: params["figure"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end

    @figure.save

    redirect "/figures/#{@figure.id}" #single quotes throw an error of bad URL
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    #binding.pry
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    #binding.pry
    erb :'/figures/edit'
  end

  post '/figures/:id' do 
    #binding.pry
    @figure = Figure.find(params[:id])
    #binding.pry
    @figure.landmarks << Landmark.create(params[:landmark])
    #raise params[:figure].inspect
    @figure.update(params[:figure])


    #raise @figure.inspect
   
    redirect "/figures/#{@figure.id}"
  end





end
