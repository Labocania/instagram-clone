FactoryGirl.define do
  factory :post do
    caption 'coffe'
    image_file_name { 'coffe.png' }
    image_content_type { 'image/png' }
    image_file_size { '84' }
    user_id 1
    id 1
  end
  
  factory :post_two, class: Post do
    caption 'bla'
    image_file_name { 'coffe.png' }
    image_content_type { 'image/png' }
    image_file_size { '84' }
    user_id 1
    id 2
  end
end