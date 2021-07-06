class Store < ApplicationRecord
  belongs_to :user
  has_many :store_products
  has_many :products, through: :store_products
  validates :name, presence: true, length: {maximum: 100}
  validates :street, presence: true, length: {maximum: 100}
  validates :number, presence: true, length: {maximum: 100}
  validates :zip_code, presence: true, length: {maximum: 100}
  validates :city, presence: true, length: {maximum: 100}
  validates :country, presence: true, length: {maximum: 100}
end