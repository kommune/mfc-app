class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :birth_date, presence: true

  enum gender: [ :male, :female ]
  enum marital_status: [ :single, :married, :divorced, :widowed ]
  enum children: [ :yes, :no ]

end

