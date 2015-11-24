require "spec_helper"

feature "Deleting comments" do
  background do 
    # create user_one from factory
    user = create :user
    # create user_two from factor with a different user name & email
    second_user = create :second_user
    # create a post from factory belonging to user_one
    post = create :post
    # create a comment from factory for the post created by user_two
    comment = create :comment
    second_comment = create :second_comment
    # sign in as user_two
    sign_in_with second_user
  end
  
  scenario "deleting your comment on other posts" do
    # visit the root path
    visit '/'
    # delete the offending comment belonging to you.
    page.has_content? "Comment!"
    click_link 'delete-comment'
    # expect that the comment no longer exists
    page.has_no_content? "Comment!"
  end
  
  scenario "not deleting other comments" do
    page.has_content? "My comment!"
    page.has_no_link? "delete-comment"
  end
=begin
  scenario "not sending a deleting request to other comments" do
    visit "/"
    page.has_content? "My comment!"
    # send a DELETE request to the comment’s path
    page.driver.submit :delete, "posts/1/comments/2", {}
    expect(page).to eq root_path
  end
=end
end