require 'spec_helper'

describe Post do
  let(:post) {Post.new :title => "New Post!", :content => "A great story"}
  it "title should be automatically titleized before save" do

    post.save
    post.title.should eq "New Post"
  end

  it "post should be unpublished by default" do
    post.is_published.should be_false
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    expect {
      post.save
     }.to change { post.slug }.from(nil).to('new-post')
    end
end
