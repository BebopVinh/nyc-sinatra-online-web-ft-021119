class FiguresController < ApplicationController
   get '/figures' do
      erb :'/figures/index'
   end
  
   get '/figures/new' do
      @landmarks = Landmark.all
      @titles = Title.all
      erb :'/figures/new'
   end

   post '/figures' do
      @figure = Figure.create(params[:figure])
      unless params[:title][:name].empty?
         @figure.titles << Title.new(params[:title])
      end

      unless params[:landmark][:name].empty?
         @figure.landmarks << Landmark.new(params[:landmark])
      end
      @figure.save
      redirect to("/figures/#{@figure.id}")
   end

   get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'/figures/show'
   end

   post '/figures/:id/edit' do
      redirect "/figures/#{params[:id]}/edit"
   end

   get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      erb :'/figures/edit'
   end

   post '/figures/:id' do
      binding.pry
      redirect '/figures/:id'
   end
end
