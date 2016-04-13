require 'sinatra'
require 'sinatra/reloader' if development?

require File.expand_path '../lib/calculator.rb', __FILE__

get '/' do
	@preview_result = Calculator.load_result()
	erb(:calculator)
end

post "/result" do
	@operation = params["operation"]
	@first = params[:first_number].to_f
	@second = params[:second_number].to_f
	@result = Calculator.make_operation(@operation, @first, @second)
  erb(:result)
end

post "/save" do
	Calculator.save_in_file(params[:result])
	redirect to("/")
end