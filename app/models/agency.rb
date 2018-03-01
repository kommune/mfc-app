class Agency < ApplicationRecord

  enum category: [:financial, :family, :food_rations, :donations, :health, :elderly, :children, :teens, :unemployment, :homeless, :mental_health, :addictions, :special_needs, :disability]
end
