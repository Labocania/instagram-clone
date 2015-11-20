require 'spec_helper'

feature 'Creating posts' do
  background do
    user = create :user
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  
  scenario 'can create a new post' do
    click_link 'New Post'
    attach_file('post_image', "spec/files/images/coffee.png")
    fill_in 'Caption', with: "nom nom nom"
    click_button 'Create Post'
    page.has_content? "nom nom nom"
    page.has_css? "img[src*='coffee']"
  end
  
  scenario 'a post needs an image to save' do
    click_link 'New Post'
    fill_in 'Caption', with: 'No picture.'
    click_button 'Create Post'
    page.has_content? "can't be blank"
  end
  
end