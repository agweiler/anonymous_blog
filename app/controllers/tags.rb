get '/tags' do

  actual_tag = Tag.where(name: params[:name]).first
  @post =  actual_tag.posts
# tag_id = PostTags.where(tag_id: )

# tag.posts

  erb :'/alltags'
end

