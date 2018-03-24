class Contact < ApplicationRecord

  validates :name, presence: true

  enum status: [ :received, :replied ]

end
