class User < ApplicationRecord
  attr_reader :password

  before_save :hash_password, :create_session_token
  validates :email, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  def password=(password)
    @password = password
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    hash_password = BCrypt::Password.new(user.password_digest)

    return user if hash_password.is_password?(password)

    nil
  end

  def hash_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
end
