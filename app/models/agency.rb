class Agency < ApplicationRecord

  validates :name, presence: true

  enum area: [ :north, :south, :east, :west, :central, :no_boundary ]

  has_one :user
  has_many :agencies_categories, dependent: :destroy
  has_many :categories, through: :agencies_categories

  searchkick word_start: [:name, :street_name, :description]
  scope :search_import, -> { includes(:categories) }

  def search_data
    attributes.merge(
      categories_name: categories.map(&:name)
    )
  end


end
