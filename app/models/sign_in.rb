class SignIn < ActiveRecord::Base
  validates_presence_of :user, :session_token
  validates_uniqueness_of :session_token

  belongs_to :user, inverse_of: :sign_ins

  after_initialize :ensure_session_token
  # Methods

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end


  def ==(other)
    other.is_a?(SignIn) && self.session_token == other.session_token
  end


  private

  def generate_unique_session_token
    loop do
      token = SecureRandom.urlsafe_base64
      return token unless SignIn.exists?(session_token: token)
    end
  end


end
