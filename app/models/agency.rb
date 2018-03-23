class Agency < ApplicationRecord

  after_save ThinkingSphinx::RealTime.callback_for(:agency)

  validates :name, presence: true

  enum area: [ :north, :south, :east, :west, :central ]

  has_many :agencies_categories, dependent: :destroy
  has_many :categories, through: :agencies_categories
  has_one :agencyuser

end
