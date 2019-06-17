class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
  has_many :reviews, dependent: :destroy
  has_many :orders

  def lock_user
    update locked_at: Time.zone.now
  end

  def unlock_user
    update locked_at: nil
  end
end
