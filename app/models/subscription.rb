class Subscription < ApplicationRecord
  belongs_to :message_board
  belongs_to :user
  belongs_to :agencyuser
end
