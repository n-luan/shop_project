class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  accepts_nested_attributes_for :user, update_only: true
  validates :address, :presence => true, on: :update
  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }, on: :update
end
