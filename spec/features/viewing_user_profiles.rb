require "spec_helper"

feature "viewing user profiles" do
  background do
    # Create a user.
    user = create :user
    # Create a second user
    second_user = create :second_user
    # Create a post owned by the user.
    post = create :post
    # Create a post owned by the second user.
    post_twp = create :post_three
    # Sign in with the first user.
    sign_in_with user
    # Visit the dashboard.
    visit "/"
    # Click the first user's user name
    click_link "Arnie"
  end
  
  scenario "visiting a profile page shows the user name in the url" do
    # Expect the page's URL to be '/users/user-name'.
    expect(page.current_path).to eq(profile_path("Arnie"))
  end
  
  scenario "a profile page only shows the specified user's post" do
    # expect the page to show the user-owned post.
    page.has_content? "coffee"
    # expect the page to not show the other user's post.
    page.has_no_content? "bla bla bla"
  end
end