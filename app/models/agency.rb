class Agency < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true

  enum category: [:financial, :family, :food_rations, :donations, :health, :elderly, :children, :teens, :unemployment, :homeless, :mental_health, :addictions, :special_needs, :disability]
end
