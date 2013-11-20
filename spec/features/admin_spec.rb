require 'spec_helper'

feature 'Admin panel' do
  context "on admin homepage" do

##put this Post.create in a before_all or before block
    Post.create :title => "New Post!", :content => "A great story"
    it "can see a list of recent posts" do
      visit admin_posts_url
      page.should have_content "New"
    end

    xit "can edit a post by clicking the edit link next to a post"

    xit "can delete a post by clicking the delete link next to a post"

    xit "can create a new post and view it" do
       visit new_admin_post_url

       expect {
         fill_in 'post_title',   with: "Hello world!"
         fill_in 'post_content', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         page.check('post_is_published')
         click_button "Save"
       }.to change(Post, :count).by(1)

       page.should have_content "Published: true"
       page.should have_content "Post was successfully saved."
     end
  end

  context "editing post" do
    xit "can mark an existing post as unpublished" do
      pending # remove this line when you're working on implementing this test

      page.should have_content "Published: false"
    end
  end

  context "on post show page" do
    xit "can visit a post show page by clicking the title"

    xit "can see an edit link that takes you to the edit post path"

    xit "can go to the admin homepage by clicking the Admin welcome page link"
  end
end
