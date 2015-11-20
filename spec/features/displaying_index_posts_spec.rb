require "spec_helper"

feature "Displaying posts" do
  background do
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post_two, caption: "This is the second post")
    user = create :user
    
    visit "/"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
  
  scenario "The index lists all posts" do
    page.has_content? "This is post one"
    page.has_content? "This is the second post"
    page.has_css? "img[src*='coffe']"
  end
end