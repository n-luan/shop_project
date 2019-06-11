class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :reviews, dependent: :destroy
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders

  scope :products, -> {order(created_at: :desc)}
  scope :best_product, -> {order(sale_count: :desc)}
end
