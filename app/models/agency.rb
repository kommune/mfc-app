class Agency < ApplicationRecord

  searchkick _all: false, default_fields: [:name, :street_name, :postal_code, :area, :criteria, :description]
  
  validates :name, presence: true

  enum area: [ :north, :south, :east, :west, :central, :all_areas ]

  has_many :agencies_categories, dependent: :destroy
  has_many :categories, through: :agencies_categories
  has_one :agencyuser

end
