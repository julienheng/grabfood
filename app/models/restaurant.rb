class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
