require 'sinatra'
require 'json'

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
end
