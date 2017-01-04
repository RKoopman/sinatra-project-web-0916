class UsersController < ApplicationController

  get '/users' do

    if params[:user]
      @users = User.where("user_name like '%#{params[:user].downcase }%'")
    else
      @users = User.all
    end
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(params[:user])
    redirect to "users/#{@user.id}"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end


  post '/users/:id' do
  # binding.pry
    @user = User.find(params[:id])
    @rest = Restaurant.find(params[:users][:restaurant_id])
    @user.restaurants << @rest
    redirect to "/users/#{@user.id}"
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  patch '/users/:id' do
    # binding.pry
    @user = User.find(params[:id])
    @user.update(params[:user])
    @user.save
    redirect to "/users/#{@user.id}"
  end

  delete '/users/:id/delete' do
    @user = User.find(params[:id])
    @user.destroy
    redirect to '/users'
  end
end
