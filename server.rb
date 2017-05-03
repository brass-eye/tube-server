require 'sinatra'
require 'json'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "foo.sqlite3"}


get '/visits' do
	content_type :json
	{
		:visits => {:MAR => {
			:name => "Marble Arch",
			:visit_count => 6
		}, :WAT => {
			:name => "Waterloo",
			:visit_count => 10
		}},
		:total_visits => 16
	}.to_json
end

post '/visits' do
	request.body.rewind
	request_payload = JSON.parse(request.body.read, :symbolize_names => true)
	request_payload[:selected_station].to_json
end


get '/record' do
	Stations.new(:code => "WAT", :name => "Waterloo").save()
	Stations.all.to_json
end

class Visits < ActiveRecord::Base

end

class Stations < ActiveRecord::Base


end