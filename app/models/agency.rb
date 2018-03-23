class Agency < ApplicationRecord

  validates :name, presence: true

  enum area: [ :north, :south, :east, :west ]

  has_many :agencies_categories, dependent: :destroy
  has_many :categories, through: :agencies_categories
  has_one :agencyuser

end
