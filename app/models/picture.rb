class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favos, dependent: :destroy
  has_many :favo_users, through: :favos, source: :user
  
  validates :image, :content, presence: true
end
