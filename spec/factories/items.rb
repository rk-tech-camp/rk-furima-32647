FactoryBot.define do
  factory :item do
    item_name    {Faker::Lorem.sentence} #:Lorem ダミーテキスト
    item_note    {Faker::Lorem.sentence} #:Lorem ダミーテキスト
    genre_id     {1}
    status_id    {1}
    charge_id    {1}
    shipping_id  {1}
    region_id    {1}
    price        {5000}
    association :user
    
    
    
    
    after(:build) do |item|
     item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end

  end
    
   
    
end
