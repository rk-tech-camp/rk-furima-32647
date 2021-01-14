class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal, :region_id, :city, :build, :number, :phone, :user_id, :item_id, :token

  # attr_accessorで使いたいカラムを設定
  # 住所に関するバリデーション、orderに関するバリデーション
  # saveメソッドを作る。Addressの保存とorderの保存をしてくれるメソッド。

  with_options presence: true do
    validates :region_id, numericality: { other_than: 0 }
    validates :city
    validates :number
    validates :phone, format: { with: /\A\d{11}\z/ }
    validates :postal, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(postal: postal, region_id: region_id, city: city, number: number, build: build, phone: phone,
                   order_id: order.id)
  end
end
