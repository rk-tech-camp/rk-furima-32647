class Shipping < ActiveHash::Base
	self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '１〜２日で発送' },
    { id: 2, name: '２〜３日で発送' },
    { id: 3, name: '３〜４日で発送' },
    
  ]
  include ActiveHash::Associations
  has_many :items

end
