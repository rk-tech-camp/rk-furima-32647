class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :genre
    belongs_to :status
    belongs_to :charge
    belongs_to :shipping
    belongs_to :region
  end

  with_options presence: true do
    validates :item_name
    validates :item_note
    validates :image

    with_options numericality: { other_than: 0 } do
      validates :genre_id
      validates :status_id
      validates :charge_id
      validates :region_id
      validates :shipping_id
    end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/ }
  end
end
