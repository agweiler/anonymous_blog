# Create new post
require 'byebug'

post '/create_post' do

  post = Post.create(title: params[:title],content: params[:content])
  tag_array = params[:tags].split(/\s*,\s*/)
  tag_array.each do |tag|
    @tag = Tag.find_or_create_by(name: tag.downcase)
    post.tags << @tag
  end
    redirect to "/"
end
# post = Post.find 1
# post.tags.create(name: something)
# tag = Tag.create(name:something)
# PostsTag.create(tag_id: tag.id, post_id: post.id)
# Tag.find_or_create_by(name: "something")

get '/create_post' do
  erb :'posts/create_post'
end

# Show all Posts

get '/posts/all' do
  @post = Post.all

  # puts @post.inspect
  erb :'posts/all'
end

# Search for Post

post "/posts/find" do
  test = params[:title]

  @post = Post.find_by title: test
 # @post = Post.where(title: params[:title])

erb :'posts/show'
end

# get "/posts/#{@test}" do
#   erb
# end

post "/posts/delete" do
  test = params[:title]

  @post = Post.find_by title: test
  @post.destroy
 # @post = Post.where(title: params[:title])

erb :index
end

post "/posts/update" do
  test = params[:title]

  @post = Post.find_by title: test
  @post.update(content: params[:update])
 # @post = Post.where(title: params[:title])

erb :index
end

#FIND ALL posts where tag name = user input

