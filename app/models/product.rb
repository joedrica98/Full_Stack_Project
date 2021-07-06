class Product < ApplicationRecord
  belongs_to :category
  has_many :store_products
  has_many :stores, through: :store_products
  validates :name, presence: true, length: {maximum: 25 }
  validates :size, presence: true, length: {maximum: 25 }
  validates :price, presence: true, length: {maximum: 25 }
  validates_uniqueness_of :name
end