class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
  has_many :reviews, dependent: :destroy
  has_many :orders
  has_many :notifications

  scope :group_by_type, -> (type) {
     case type
     when "day"
       group("DATE_FORMAT(created_at, '%d-%b-%x')").count
     when "week"
       group("DATE_FORMAT(created_at,'Week %v')").count
     when "month"
       group("DATE_FORMAT(created_at,'%b-%x')").count
     end
   }

  class << self
    def all_data_user
      data = []
      day = group_by_type("day")
      date = day.keys
      user = day.values
      max = 14
      title = "Daily"
      data << {"date" => date, "user" => user, "max" => max, "title" => title}
    end
    def all_data_user1
      data = []
      week = group_by_type("week")
      date = week.keys
      user = week.values
      max = week.size-1
      title = "Weekly"
      data << {"date" => date, "user" => user, "max" => max, "title" => title}
    end
    def all_data_user2
      data = []
      month = group_by_type("month")
      date = month.keys
      user = month.values
      max = month.size-1
      title = "Monthly"
      data << {"date" => date, "user" => user, "max" => max, "title" => title}
    end
  end

  def lock_user
    update locked_at: Time.zone.now
  end

  def unlock_user
    update locked_at: nil
  end

end
