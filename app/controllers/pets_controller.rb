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
    if !!params[:owner][:name]
      o=Owner.create(:name=>params[:owner][:name])
    else
      o=Owner.find_by_id(params[:owner_id])
    end
    @pet=Pet.create(params[:pet])
    o.pets<<@pet
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
