class User < ActiveRecord::Base

  # Validations
  validates_presence_of :email, :name, :password_digest
  validates_uniqueness_of :email
  validates :activation_token, uniqueness: { allow_nil: true }
  validates :activated, inclusion: { in: [true, false] }
  validates :password, length: { minimum: 6, allow_nil: true }


  # Associations
  has_many :sign_ins, inverse_of: :user

  # Methods
  attr_reader :password

  def self.find_by_credentials(credentials)
    user = User.find_by_email(credentials[:email])
    user && user.is_password?(credentials[:password]) ? user : nil
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
