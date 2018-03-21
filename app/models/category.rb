class Category < ApplicationRecord

  validates :name, presence: true

  has_many :agencies_categories, dependent: :destroy
  has_many :agencies, through: :agencies_categories

end
