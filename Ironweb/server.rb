require 'sinatra'
require 'sinatra/reloader' if development?

require 'pry'

set :haml, format: :html5
enable(:sessions)

COURSES = [
  { name: 'intro to Rails', advanced: false, id: 1 },
  { name: 'advanced Rails', advanced: true, id: 2 },
  { name: 'intro to sinatra', advanced: false, id: 3 },
  { name: 'advanced sinatra', advanced: true, id: 3 }
].freeze

get '/' do
  if session[:name]
    redirect to(:show_profile)
  else
    haml(:index)
  end
end

get '/create_profile' do
  haml(:create_profile)
end

post '/save_profile' do
  if params[:name].to_s.empty? ||
     params[:birthdate].to_s.empty? ||
     params[:email].to_s.empty? ||
     params[:advanced].to_s.empty?
    @name = params[:name]
    @birthdate = params[:birthdate]
    @email = params[:email]
    @address = params[:address]
    @advanced = params[:advanced] == 'yes'
    @error = 'Error in form!'
    haml(:create_profile)
  else
    session[:name] = params[:name]
    session[:birthdate] = params[:birthdate]
    session[:email] = params[:email]
    session[:address] = params[:address]
    session[:advanced] = params[:advanced] == 'yes'
    session[:courses] = []
    redirect to(:show_profile)
  end
end

get '/show_profile' do
  @name = session[:name]
  @age = Time.now.year - session[:birthdate].to_i
  @email = session[:email]
  @address = session[:address]
  @advanced = session[:advanced]
  @courses_session = session[:courses]
  @courses = COURSES.select { |course| course[:advanced] == session[:advanced] }
  haml(:show_profile)
end

get '/sing_up_course/:id' do
  course = COURSES.select { |course| course[:id] == params[:id].to_i }
  session[:courses] << course[0]
  redirect to(:show_profile)
end
