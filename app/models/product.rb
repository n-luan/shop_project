class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :product_order, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :reviews, dependent: :destroy
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders
  mount_uploader :image, ImageUploader

  scope :products, -> {order(created_at: :desc)}
  scope :best_product, -> {order(sale_count: :desc)}

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
