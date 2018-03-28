class Agency < ApplicationRecord

  searchkick word_start: [:name, :street_name, :description]

  validates :name, presence: true

  enum area: [ :north, :south, :east, :west, :central, :all_areas ]

  has_many :agencies_categories, dependent: :destroy
  has_many :categories, through: :agencies_categories

end
