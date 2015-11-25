require "spec_helper"

feature "editing user profiles" do
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
  end
  
  scenario "a user can change their own profile details" do
    # Click the first user's user name
    click_link "Arnie"
    # Click the 'Edit Profile' button.
    click_link "Edit Profile"
    # Click the 'Choose new profile image' button.
    # Select the new image.
    attach_file("user_avatar", "spec/files/images/avatar.jpg")
    # Fill in the bio field with 'Is this real life?'
    fill_in "user_bio", with: "Is this real life?"
    # Click the 'Update Profile' button.
    click_button "Update Profile"

    # Expect to be routed to the profile page.
    expect(page.current_path).to eq(profile_path("Arnie"))
    # Expect to see the updated profile image.
    page.has_css? "img[src*='avatar']"
    # Expect to see the updated profile bio.
    page.has_content? "Is this real life?"
  end
  
  scenario "a user cannot change someone elses profile picture" do
    # Click the first user's user name
    click_link "Second User"
    # Expect to not see the 'edit profile' button.
    page.has_no_content? "Edit Profile"
  end
  
  scenario "a user cannot navigate directly to edit a users profile" do
    # Directly visit another user’s edit url.
    visit "/SecondUser/edit"
    # Expect to not see ’Change your profile image:'
    page.has_no_content? "Change your profile image:"
    # Expect the path to be the root path.
    expect(page.current_path).to eq(root_path)
    # Expect to see the message, "That profile doesn’t belong to you!"
    page.has_content? "That profile doesn't belong to you!"
  end
end