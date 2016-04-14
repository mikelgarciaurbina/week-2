require 'sinatra'
require 'sinatra/reloader' if development?

enable(:sessions)

get '/' do
	haml(:index)
end

get '/puertas/:name/:year' do
	@name = params[:name]
	@year = params[:year]
	haml(:club_validator)
end

get '/puertas' do
	@name = session[:name]
	@year = session[:year]
	haml(:club_validator)
end

get '/puertas/profile' do
	haml(:club_profile)
end

get '/user/profile' do
	@name = session[:name]
	@year = session[:year]
	haml(:profile)
end

post '/puertas/results' do
	@name = params[:name]
	@year = params[:year]
	if params[:name].to_s.empty?
		@error = "Error in name!"
		haml(:club_profile)
	elsif params[:year].to_s.empty?
		@error = "Error in year!"
		haml(:club_profile)
	else
		session[:name] = params[:name]
		session[:year] = params[:year]
		redirect to("/user/profile")
	end
end