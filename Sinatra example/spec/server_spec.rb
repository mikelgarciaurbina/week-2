require File.expand_path '../spec_helper', __FILE__

describe "My Sinatra app" do
	it "hours ago" do
		time_ago = Time.now - 7*60*60
		get "/hours/ago/7"
		expect(last_response.body).to include(time_ago.to_s)
	end

	it 'club validator' do
		get "/puertas/Jacobo/1985"
		expect(last_response.body).to include("you can access")
	end

	it 'club validator' do
		get "/puertas/Jacobo/2000"
		expect(last_response.body).to include("you can´t access")
	end

	it 'club validator' do
		name = "pepe" + rand(1000).to_s 
		get "/puertas/#{name}/2000"
		expect(last_response.body).to include(name)
	end
end