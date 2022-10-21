class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/games' do
    response = Game.all.order(:title).limit(10)
    response.to_json
  end

  get '/games/:id' do
    response = Game.find(params[:id])
    response.to_json(only: [:id, :title, :genre, :price], include: { reviews: {only: [:comment, :score], include: {user: {only: [:name]}}}})
  end

end
