class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  scope :products, -> {order(created_at: :desc)}
  scope :best_product, -> {order(sale_count: :desc)}
end
