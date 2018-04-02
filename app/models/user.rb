class User < ApplicationRecord

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, authentication_keys: [:login]

  searchkick _all: false, default_fields: [:postal_code]

  has_many :visits, class_name: "Ahoy::Visit"
  
  visitable

  validates :name, presence: true
  validates :username, presence: :true, uniqueness: true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :birth_date, presence: true
  validates :postal_code, numericality: { only_integer: true }
  validate :birth

  enum gender: [ :male, :female ]
  enum marital_status: [ :single, :married, :divorced, :widowed ]
  enum children: [ :no, :yes ]
  enum role: [ :user, :agency_user ]

  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :message_boards, through: :subscriptions
  has_many :visits, class_name: "Ahoy::Visit"

  belongs_to :agency, optional: true

  def user?
    self.role == "user"
  end

  def existing_message_boards_users
    existing_message_board_users = []
    self.message_boards.each do |message_board|
      existing_message_board_users.concat(message_board.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
    end
    existing_message_board_users.uniq
  end

  def birth
    errors.add(:birth_date, "is incorrect") if
    birth_date.present? && birth_date > Time.zone.today
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
    end
  end

end

