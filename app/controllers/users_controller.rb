class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(params)                 # create/ saves new instance of User record with params.
    @restaurant = Restaurant.create(params)     # create/ saves new instance of Restaurant record with params.
    @user.restaurants << @restaurant            # will add the newly created restaurant record to that users' collection of restaurants.
    @user.save                                  # saves the updated user
    redirect to "users/#{@user.id}"             # redirectes to that user's show page
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.save
    redirect to "/users/#{@user.id}"
  end

  delete '/users/:id/delete' do
    @user = User.find(params[:id])
    @user.destroy
    redirect to '/users'
  end



end
