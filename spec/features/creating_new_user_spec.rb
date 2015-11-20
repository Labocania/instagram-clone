require 'spec_helper.rb'

feature 'Creating a new user' do 
  background do
    # Visit the home page
    visit '/'
    # Click the 'Register' link
    click_link 'Register'
  end
  
  scenario 'can create a new user via the index page' do
    # Fill in the 'User name' field with ’sxyrailsdev'
    fill_in 'User Name', with: 'sxyrailsdev'
    # Fill in the 'Email' field with 'sxyrailsdev@myspace.com'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    # Fill in the 'Password' field with 'supersecret'
    fill_in 'Password', with: 'supersecret'
    # Fill in the 'Password confirmation' field with 'supersecret'
    fill_in 'Confirm Password', with: 'supersecret'
    # Click the 'Sign up' button
    click_button 'Sign up'
    # Expect the page to have the message 'Welcome! You have signed up successfully.'
    page.has_content? 'Welcome! You have signed up successfully.'
  end
  
  scenario 'requires a user name to successfully create an account' do
    # Fill in the 'Email' field with 'sxyrailsdev@myspace.com'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    # Fill in the 'Password' field with 'supersecret'
    fill_in 'Password', with: 'supersecret'
    # Fill in the 'Password confirmation' field with 'supersecret'
    fill_in 'Confirm Password', with: 'supersecret'
    # Click the 'Sign up' button
    click_button 'Sign up'
    # Expect the page to have the message 'You need a user name to create an account.'
    page.has_content? 'You need a user name to create an account.'
  end
  
  scenario 'requires a user name to be more than 4 characters' do
    # Fill in the 'User name' field with 'h'
    fill_in 'User Name', with: 'h'
    # Fill in the 'Email' field with 'sxyrailsdev@myspace.com'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    # Fill in the 'Password' field with 'supersecret'
    fill_in 'Password', with: 'supersecret'
    # Fill in the 'Password confirmation' field with 'supersecret'
    fill_in 'Confirm Password', with: 'supersecret'
    # Click the 'Sign up' button
    click_button 'Sign up'
    # Expect the page to have the message 'minimum is 4 characters'
    page.has_content? 'minimum is 4 characters'
  end
  
  scenario 'requires a user name to be less than 12 characters' do
    # Fill in the 'User name' field with a name with more than 12 characters
    fill_in 'User Name', with: 'h' * 13
    # Fill in the 'Email' field with 'sxyrailsdev@myspace.com'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
     # Fill in the 'Password' field with 'supersecret'
    fill_in 'Password', with: 'supersecret'
    fill_in 'Confirm Password', with: 'supersecret'
    # Expect the page to have the message 'maximum is 12 characters'
    page.has_content? 'maximum is 12 characters'
  end
end