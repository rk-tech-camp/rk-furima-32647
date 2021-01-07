class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '新品' },
    { id: 2, name: '未使用' },
    { id: 3, name: '傷なし' },
    { id: 4, name: 'やや傷あり' },
    { id: 5, name: '傷あり' },
    { id: 6, name: '状態が悪い' },
    { id: 7, name: 'その他' }

  ]
  include ActiveHash::Associations
  has_many :items
end
