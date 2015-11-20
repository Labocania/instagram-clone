require 'spec_helper'

feature 'Deleting posts' do
  background do
    user = create :user
    post = create(:post, caption: 'Abs for days.')
    
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit post'
  end
  
  scenario 'can delete a post' do
    click_link 'Delete post'
    
    page.has_content? "Post has been deleted."
    page.has_no_content? "Abs for days."
  end
end