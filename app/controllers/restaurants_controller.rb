class RestaurantsController < ApplicationController

  get '/restaurants' do
    # params[:rest]
    # binding.pry
    @restaurants = Restaurant.all
    erb :'restaurants/index'
  end

  get '/restaurants/new' do
    erb :'restaurants/new'
  end

  # create
  post '/restaurants' do
    search_term = self.params[:search_term]
    rest_location = self.params[:city]
    params = {term: "#{search_term}", limit: 10, sort: 0}
    yelpinstance = YelpApi.new
    response = yelpinstance.client.search("#{rest_location}", params)
    rest_creator  = YelpRestaurantCreator.new
    rest_creator.yelp_restaurant_creator(response)
    redirect to "restaurants"
  end

# shouldn't need
  post '/restaurants' do
    # binding.pry
    @restaurant = Restaurant.create(params[:restaurant])
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

# shouldn't need edit
  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit'
  end

# shouldn't need edit
  patch '/restaurants/:id' do
    # binding.pry
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
    # @restaurant.update(params[:rest_name, :rating, :address])
    redirect to "restaurants/#{@restaurant.id}"
  end

  delete '/restaurants/:id/delete' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect to "/restaurants"
  end
end
