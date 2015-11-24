require "spec_helper"

feature "Editing posts" do
  background do
    user = create :user
    post = create :post
    
    sign_in_with user
    
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_link "Edit post"
  end
  
  scenario "can edit a post" do 
    fill_in "Caption", with: "Bla bla bla"
    
    click_button "Update Post"
    
    page.has_content? "Post Updated."
    page.has_content? "Bla bla bla"
  end
  
  scenario "can't edit other user's post" do
    second_user = create :second_user
    post_three = create :post_three
    
    visit post_path(post_three)
    page.has_no_content? "Edit post"
  end
  
  scenario "can't edit a post that doesn't belong to you via url path" do
    second_user = create :second_user
    post_three = create :post_three
    
    visit "/posts/3/edit"
    expect(page.current_path).to eq root_path
    page.has_content? "This post doesn't belong to you!"
  end
end