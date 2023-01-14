class User < ApplicationRecord
  before_create -> { self.email = email.strip.downcase }

  has_secure_password

  has_one :wallet, dependent: :destroy
  has_many :pokemon

  after_create :create_default_wallet

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :password, presence: true

  def self.login!(email:, password:)
    user = User.find_by!(email: email)
    raise ActiveRecord::RecordNotFound unless user.authenticate(password)

    user
  end

  private

  def create_default_wallet
    Wallet.create(user_id: id)
  end
end
