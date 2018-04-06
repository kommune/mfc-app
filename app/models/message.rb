class Message < ApplicationRecord

  before_save :encrypted_body

  belongs_to :user
  belongs_to :message_board

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  private

  def encrypted_body
    salt = ENV['SALT']
    key = ENV['KEY']
    crypt = ActiveSupport::MessageEncryptor.new(key)
    body = self.body
    encrypted_data = crypt.encrypt_and_sign(body) 
    self.body = encrypted_data
  end

end
