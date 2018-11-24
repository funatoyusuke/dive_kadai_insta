class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favos, dependent: :destroy
  has_many :favo_users, through: :favos, source: :user

  validates :image, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
