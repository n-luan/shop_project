class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders
  before_save :update_subtotal

  scope :group_by_type, -> (type) {
    case type
    when "day"
      group("DATE_FORMAT(created_at, '%d-%b-%x')").count
    when "week"
      group("DATE_FORMAT(created_at,'%v-%x')").count
    when "month"
      group("DATE_FORMAT(created_at,'%b-%x')").count
    end
  }

  class << self
    def all_data_order
      data = []
      day = group_by_type("day")
      date = day.keys
      order = day.values
      data << {"date" => date, "order" => order}
    end
    def all_data_order1
      data = []
      week = group_by_type("week")
      date = week.keys
      order = week.values
      data << {"date" => date, "order" => order}
    end
    def all_data_order2
      data = []
      month = group_by_type("month")
      date = month.keys
      order = month.values
      data << {"date" => date, "order" => order}
    end
  end

  def subtotal
    product_orders.collect { |po| po.valid? ? (po.quantity*(po.product.sale_price || po.product.price)) : 0 }.sum
  end

  def total_quantity
    product_orders.collect{ |po| po.valid? ? po.quantity : 0}.sum
  end

  private
  def update_subtotal
    self[:subtotal] = subtotal
  end
end
