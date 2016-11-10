class RestaurantsController < ApplicationController

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurants/index'
  end

  get '/restaurants/new' do
    erb :'restaurants/new'
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params)

    redirect to "restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/show'
  end

  post '/restaurants/:id' do
  # binding.pry
  @restaurant = Restaurant.find(params[:id])
  @user = User.find(params[:restaurants][:user_id])
  @restaurant.users << @user
  redirect to "/restaurants/#{@restaurant.id}"
end

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit'
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.rest_name = params[:rest_name]
    @restaurant.rating = params[:rating]
    @restaurant.address = params[:address]
    @restaurant.save
    redirect to "restaurants/#{@restaurant.id}"
  end

  delete '/restaurants/:id/delete' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
  end

end
