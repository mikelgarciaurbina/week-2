require File.expand_path '../spec_helper', __FILE__

describe 'My Ironweb app' do
  describe 'index page' do
    it 'gives status 200' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'renders index page' do
      get '/'
      expect(last_response.body.downcase).to include('ironweb')
    end
  end

  describe 'create profile page' do
    it 'gives status 200' do
      get '/create_profile'
      expect(last_response).to be_ok
    end
  end

  describe 'save profile page' do
    it 'name in session' do
      params = {
        name: 'Mikel',
        birthdate: 1992,
        email: 'mikel_6@hotmail.com',
        advanced: 'yes'
      }
      post '/save_profile', params
      expect(session[:name]).to eq('Mikel')
    end

    it 'birthdate in session' do
      params = {
        name: 'Mikel',
        birthdate: 1992,
        email: 'mikel_6@hotmail.com',
        advanced: 'yes'
      }
      post '/save_profile', params
      expect(session[:birthdate].to_i).to eq(1992)
    end

    it 'email in session' do
      params = {
        name: 'Mikel',
        birthdate: 1992,
        email: 'mikel_6@hotmail.com',
        advanced: 'yes'
      }
      post '/save_profile', params
      expect(session[:email]).to eq('mikel_6@hotmail.com')
    end

    it 'advanced in session' do
      params = {
        name: 'Mikel',
        birthdate: 1992,
        email: 'mikel_6@hotmail.com',
        advanced: 'yes'
      }
      post '/save_profile', params
      expect(session[:advanced]).to eq(true)
    end
  end

  describe 'show profile page' do
    it 'gives status 200' do
      get '/show_profile'
      expect(last_response).to be_ok
    end
  end
end
