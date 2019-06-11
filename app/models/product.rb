class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :reviews, dependent: :destroy
  scope :products, -> {order(created_at: :desc)}
  scope :best_product, -> {order(sale_count: :desc)}
end
