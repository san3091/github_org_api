require 'sinatra'
require_relative './models/organization'

get '/github/:org/:repo' do
  @organization = Github::Organization.get("#{params[:org]}", "#{params[:repo]}")
  erb :index
end