class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items
  has_many :orders, through: :order_items
  validates :name, :price, presence: true
  has_one_attached :photo
end
