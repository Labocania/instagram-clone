require 'spec_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end
  
  scenario 'can log in from the index via dynamic navbar' do
    # visit the index
    visit '/'
    # expect the page to not have the 'New Post' link yet
    page.has_no_link? 'New Post'

    # click the 'Login' link
    click_link 'Login'
    # fill in the email field with the user’s email
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    # fill in the password field with the user’s password
    fill_in 'Password', with: 'illbeback'
    # click the 'Log in' button
    click_button 'Log in'

    # expect the page to have content saying 'Signed in successfully.'
    page.has_content? 'Signed in successfully.'
    # expect the 'Register' link to disappear
    page.has_no_link? 'Register'
    # expect the 'Logout' link to be present
    page.has_link? 'Logout'
  end
  
  scenario 'can log out once logged in' do
    # visit the index
    visit '/'
    # click the 'Login' link
    click_link 'Login'
    # fill in the email field with your user’s email
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    # fill in the password field with your user’s password
    fill_in 'Password', with: 'illbeback'
    # click the 'Log in' button
    click_button 'Log in'
    # click the 'Logout' link
    click_link 'Logout'
    # expect to see the text 'You need to sign in or sign up before continuing.'
    page.has_content? 'You need to sign in or sign up before continuing.'
  end
  
  scenario 'cannot view index posts without logging in' do
    # visit the root route
    visit '/'
    # expect the page to have content saying ’You need to sign in or sign up before continuing.
    page.has_content? 'You need to sign in or sign up before continuing.'
  end
  
  scenario 'cannot create a new post without logging in' do
    # visit the new_post_path
    visit new_post_path
    # expect the page to have content saying 'You need to sign in or sign up before continuing.
    page.has_content? 'You need to sign in or sign up before continuing.'
  end
end