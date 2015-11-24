FactoryGirl.define do
  factory :comment do
    id 1
    user_id 2
    post_id 1
    content "Comment!"
  end
  
  factory :second_comment, class: Comment do
    id 2
    user_id 1
    post_id 1
    content "My comment!"
  end
end