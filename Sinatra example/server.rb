require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
	@today = Date.today
	erb(:tonto)
end

get '/hours/ago/:hours_ago' do
	@hours = params[:hours_ago]
	haml(:hours_ago)
end

get '/puertas/:name/:year' do
	@name = params[:name]
	@year = params[:year]
	haml(:club_validator)
end