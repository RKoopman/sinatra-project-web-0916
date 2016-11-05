class RestaurantsController < ApplicationController

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurants/index'
  end

  get '/restaurants/new' do
    erb :'restaurants/new'
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params[:restaurant])
    @restaurant.name = params[:name]
    @restaurant.rating = params[:rating]
    @restaurant.address = params[:address]
    @restaurant.save
    redirect to "restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/show'
  end

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit'
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.name = params[:name]
    @restaurant.rating = params[:rating]
    @restaurant.address = params[:address]
    @restaurant.save
    redirect to "restaurants/#{@restaurant.id}"
  end

  delete '/restaurants/:id/delete' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    "#{@restaurant.name} has been deleted."
  end

end
