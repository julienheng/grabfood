class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :category, :location, presence: true
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_name_and_category,
                  against: %i[name category],
                  associated_against: {
                    items: :name
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
