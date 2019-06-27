class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders, dependent: :destroy
  mount_uploader :image, ImageUploader

  scope :products, -> {order(created_at: :desc)}
  scope :best_product, -> {order(sale_count: :desc)}

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

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
    def all_data_product
      data = []
      day = group_by_type("day")
      date = day.keys
      product = day.values
      data << {"date" => date, "product" => product}
    end
    def all_data_product1
      data = []
      week = group_by_type("week")
      date = week.keys
      product = week.values
      data << {"date" => date, "product" => product}
    end
    def all_data_product2
      data = []
      month = group_by_type("month")
      date = month.keys
      product = month.values
      data << {"date" => date, "product" => product}
    end
  end
end
