class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners=Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])

    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end

    @pet.save

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @owners=Owner.all
    @id=params[:id]
    @pet=Pet.find(@id)
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
    @id=params[:id]
    @pet=Pet.find(@id)
    @pet.update(params[:pet])

    if !params[:owner][:name].empty?
      o=Owner.create(params[:owner])
      @pet.owner=o
    end
      @pet.save

    redirect to "pets/#{@pet.id}"
  end
end
