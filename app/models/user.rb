class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :restaurants
  validates :name, presence: true
  validates :address, :phone, presence: true
  validates :email, confirmation: true, presence: true
  validates :password, confirmation: true, presence: true
end
