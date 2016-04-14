require 'sinatra'
require 'sinatra/reloader' if development?

require_relative './lib/blog.rb'
require_relative './lib/post.rb'

require 'pry'

set :haml, format: :html5
enable(:sessions)

blog = Blog.new
blog.add_post(Post.new('post 1',
                       Date.new(2016, 03, 10),
                       'post 1 body',
                       'Notice',
                       'M.Garcia'))
blog.add_post(Post.new('post 2',
                       Date.new(2016, 03, 12),
                       'post 2 body',
                       'Notice',
                       'M.Garcia'))

get '/' do
  blog.latest_posts
  @posts = blog.posts
  erb(:index_template)
end

get '/post_details_template/:index' do
  @post = blog.posts[params[:index].to_i]
  erb(:post_details_template)
end

get '/new_post_template' do
  erb(:new_post_template)
end

post '/create_post' do
  if params[:title].to_s.empty? ||
     params[:text].to_s.empty? ||
     params[:category].to_s.empty? ||
     params[:author].to_s.empty?
    @title = params[:title].to_s
    @text = params[:text].to_s
    @category = params[:category].to_s
    @author = params[:author].to_s
    @error = 'Error in form'
    erb(:new_post_template)
  else
    blog.add_post(Post.new(params[:title],
                           Date.today,
                           params[:text],
                           params[:category],
                           params[:author]))
    redirect to(:" ")
  end
end
