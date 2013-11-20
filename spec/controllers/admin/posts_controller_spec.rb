require 'spec_helper'

describe Admin::PostsController do
  describe "admin panel" do
    it "#index" do
      get :index
      response.status.should eq 200
    end

    it "#new" do
      get :new
      expect(response).to be_success
    end

    context "#create" do
      it "creates a post with valid params" do
        expect {
          post :create, :post => {:title => "jdjd", :content => "jdjd"}
        }.to change { Post.count }.by(1)
      end

      it "doesn't create a post when params are invalid" do
        expect {
          post :create, :post => {:title => "jdjd"}
        }.to change { Post.count }.by(0)
        expect {
          post :create, :post => {:title => "jdjd", :content => "jdjd"}
        }.to change { Post.count }.by(1)
        expect {
          post :create, :post => {:title => "jdjd", :content => "jdjd", :is_published => true}
        }.to change { Post.count }.by(1)
      end
    end

    context "#edit" do

      let(:post) {Post.new :title => "New Post!", :content => "A great story"}
      it "updates a post with valid params" do
        expect {
          post.update_attributes( title: "testing 123")
        }.to change { post.title }.to eq "Testing 123"
      end
      it "doesn't update a post when params are invalid" do
        expect {
          post.update_attributes( title: "")
        }.not_to change { post.title }.to eq "New Post"
      end
    end


    it "#destroy" do
      Post.create :title => "New Post!", :content => "A great story"
      expect {
         delete :destroy, :id => Post.last.id
         #route  action    send to controller
        }.to change { Post.count }.by(-1)
    end
  end
end
