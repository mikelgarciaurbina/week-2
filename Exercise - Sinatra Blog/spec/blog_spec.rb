require File.expand_path '../spec_helper', __FILE__
require_relative '../lib/blog.rb'
require_relative '../lib/post.rb'

describe 'Blog class' do
  let(:blog) { Blog.new }
  let(:post1) do
    Post.new('post 1',
             Date.new(2016, 03, 10),
             'post 1 body',
             'Notice',
             'M.Garcia')
  end
  let(:post2) do
    Post.new('post 1',
             Date.new(2016, 03, 11),
             'post 1 body',
             'Notice',
             'M.Garcia')
  end

  describe '#add_post' do
    it 'add post to blog' do
      expect(blog.add_post(post1)).to eq([post1])
    end
  end
  describe '#latest_posts' do
    it 'the posts to be listed in order of date' do
      blog.add_post(post1)
      blog.add_post(post2)
      expect(blog.latest_posts).to eq([post2, post1])
    end
  end
end
