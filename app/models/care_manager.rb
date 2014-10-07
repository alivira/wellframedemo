class CareManager < ActiveRecord::Base
  belongs_to :hospital
  before_create :create_remember_token
  before_save {self.email = email.downcase}
  has_many :patients
  attr_accessible :email, :hospital, :name, :password, :password_confirmation, :admin
  # validates(:name, presence: true, length: {maximum: 100})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates(:email, presence: true,
  					# format: { with: VALID_EMAIL_REGEX},
  					# uniqueness: {case_sensisitive: false})
  has_secure_password
  # validates(:password, length: {minimum:6})

  def CareManager.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def CareManager.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = CareManager.digest(CareManager.new_remember_token)
    end

end
