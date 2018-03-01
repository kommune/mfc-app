class Agency < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true

  enum category: [:financial, :family, :food_rations, :donations, :health, :elderly, :children, :teens, :employment, :homeless, :mental_health, :addictions, :counselling, :legal, :special_needs, :disability, :miscellaneous]
end
