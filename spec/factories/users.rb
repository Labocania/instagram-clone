FactoryGirl.define do
  factory :user do
    email 'fancyfrank@gmail.com'
    user_name 'Arnie'
    password 'illbeback'
    id 1
  end
  
  factory :second_user, class: User do
    email 'second_user@gmail.com'
    user_name 'Second User'
    password 'seconduser'
    id 2
  end
end