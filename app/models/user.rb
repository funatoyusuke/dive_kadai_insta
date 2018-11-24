class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pictures, dependent: :destroy
  has_many :favos, dependent: :destroy
  has_many :favo_pictures, through: :favos, source: :picture
  
  mount_uploader :iamge, ImageUploader
end
