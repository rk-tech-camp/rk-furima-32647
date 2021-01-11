class OrderAdress
	include ActiveModel::Model
  attr_accessor  :postal ,:region_id ,:city ,:build ,:number ,:phone, :user_id, :item_id
  
  belongs_to :region, :extend ActiveHash::Associations::ActiveRecordExtensions

  #attr_accessorで使いたいカラムを設定
  #住所に関するバリデーション、orderに関するバリデーション
  #saveメソッドを作る。Addressの保存とorderの保存をしてくれるメソッド。

 with_options presence: true do

  validates :region_id, numericality: { other_than: 0 }
  validates :city
  validates :number
  validates :phone  ,  format: { with: /\A\d{11}\z/ }
  validates :postal ,  format: { with: /\A\d{3}[-]\d{4}\z/ }

 end
  
  def save
    
    Address.create(postal: postal, region_id: region.id, city: city, number: number, build: build, order_id: order.id)
    
    Order.create(item_id:item.id,user_id: user.id)
  end
















	
end	
