require "spec_helper"

feature "Liking posts" do
  background do
    # Create a user via factory_girl
    user = create :user
    # Create a post for the above user.
    post = create :post
    # Visit the root route
    sign_in_with user
    
    visit "/"
  end
  
  scenario "can like a post" do
    # Click the "like" button for the above post.
    click_link("like1")
    # Expect to see a "liked-post" class appear for the button (the button will turn solid red aka Instagram).
    page.has_css? 'glyphicon-heart'
    # Expect to see my name within the "liked by" area of the post.
    page.has_content? "Arnie likes this"
  end
  
  scenario "can unlike a post" do
    # Repeat the above steps.
    # Click the "like" button once more.
    # Expect to see the "unlikes-post" class on the button.
    # Expect to NOT see my name within the "liked by" area of the post
  end
end