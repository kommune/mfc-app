class Agency < ApplicationRecord

  searchkick word_start: [:name, :street_name, :description]

  def search_data
    {
      name: name,
      street_name: street_name,
      postal_code: postal_code,
      office_number: office_number,
      criteria: criteria, 
      description: description, 
      category_ids: category_ids, 
      area: area
    }
  end
  
  validates :name, presence: true

  enum area: [ :north, :south, :east, :west, :central, :all_areas ]

  has_many :agencies_categories, dependent: :destroy
  has_many :categories, through: :agencies_categories
  has_one :agencyuser


end
