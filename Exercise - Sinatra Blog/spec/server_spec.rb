require File.expand_path '../spec_helper', __FILE__

describe 'My Sinatra Blog app' do
  describe 'index page' do
    it 'gives status 200' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'renders index page' do
      get '/'
      expect(last_response.body.downcase).to include('blog')
    end
  end

  describe 'post details page' do
    it 'gives status 200' do
      get '/post_details_template/0'
      expect(last_response).to be_ok
    end
  end

  describe 'new post page' do
    it 'gives status 200' do
      get '/new_post_template'
      expect(last_response).to be_ok
    end
  end
end
