FactoryBot.define do
  factory :order_address do
    postal     { '111-1111' }
    region_id  { 1 }
    city       { 'さいたま' }
    build      { 'ビル' }
    number     { '1-1' }
    phone      { '09012345678' }
    token      { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  
  end
end
