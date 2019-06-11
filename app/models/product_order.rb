class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }


  def total_price
    product.price * quantity
  end
end
