class Agency < ApplicationRecord

  searchkick word_start: [:name, :street_name, :description]
  scope :search_import, -> { includes(:categories) }

  def search_data
    attributes.merge(
      categories_name: categories.map(&:name)
    )
  end

  validates :name, presence: true

  enum area: [ :north, :south, :east, :west, :central, :all_areas ]

  has_many :agencies_categories, dependent: :destroy
  has_many :categories, through: :agencies_categories

end
