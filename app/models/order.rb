class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders
  before_save :update_subtotal

  def subtotal
    product_orders.collect { |po| po.valid? ? (po.quantity*po.product.sale_price) : 0 }.sum
  end

  def total_quantity
    product_orders.collect{ |po| po.valid? ? po.quantity : 0}.sum
  end

  private
  def update_subtotal
    self[:subtotal] = subtotal
  end
end
