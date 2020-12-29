class Genre < ActiveHash::Base
	self.data = [
		{ id: 0, name: '--' },
		{ id: 1, name: 'インテリア、小物' },
		{ id: 2, name: 'レディース' },
		{ id: 3, name: 'メンズ' },
		{ id: 4, name: 'キッズ' },
		{ id: 5, name: 'インテリア、住まい、小物' },
		{ id: 6, name: '本、音楽、ゲーム' },
		{ id: 7, name: 'その他' },
	
	]
	include ActiveHash::Associations
  has_many :items
	
end
