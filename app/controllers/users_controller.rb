class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(params)                 
    redirect to "users/#{@user.id}"
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
    @user.user_name = params[:user_name]
    @user.save
    redirect to "/users/#{@user.id}"
  end

  delete '/users/:id/delete' do
    @user = User.find(params[:id])
    @user.destroy
    redirect to '/users'
  end



end
