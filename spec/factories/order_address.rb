FactoryBot.define do
  factory :order_address do
    postal     { '111-1111' }
    region_id  { 1 }
    city       { 'さいたま' }
    build      { 'ビル' }
    number     { '1-1' }
    phone      { 11_111_111_111 }
    token      { 'tok_abcdefghijk00000000000000000' }
    user_id    { 1 }
    item_id    { 1 }
  end
end
