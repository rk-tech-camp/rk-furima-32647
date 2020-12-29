class Item < ApplicationRecord
	belongs_to :user
	has_one :order
	has_one_attached :image
	
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :genre
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :status
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :charge
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :shipping
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :region

	validates :category_id, numericality: { other_than: 0 } 
	validates :price, :numericality => { :greater_than_or_equal_to => 300 , :less_than_or_equal_to => 9999999}
	validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/}


end
