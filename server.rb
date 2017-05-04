require 'sinatra'
require 'json'
require 'sinatra/activerecord'
require 'sinatra/cross_origin'
register Sinatra::CrossOrigin



configure do
  enable :cross_origin
  set :allow_origin, :any
end

set :database, {adapter: "sqlite3", database: "foo.sqlite3"}


get '/visits' do
  St
end

get '/stations' do
  Stations.all.to_json
end

post '/visits' do
  request.body.rewind
  request_payload = JSON.parse(request.body.read, :symbolize_names => true)
  request_payload[:selected_station].to_json
end


class Visits < ActiveRecord::Base
  has_many :stations
end

class Stations < ActiveRecord::Base
  belongs_to :visits
end


def populate
  hash = JSON.parse(File.read('tfl-tube-data.json'), :symbolize_names => true)
  hash[:stations].each do |key, station|
    Stations.new(:code => key, :name => station).save
  end
end