class OrdersStatus < ApplicationRecord
  belongs_to :order
  belongs_to :status
end
