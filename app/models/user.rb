class User < ApplicationRecord
  before_create -> { self.email = email.strip.downcase }

  has_secure_password

  has_one :wallet, dependent: :destroy
  has_many :pokemon

  after_create :create_default_wallet

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :password, confirmation: true

  private

  def create_default_wallet
    Wallet.create(user_id: self.id)
  end
end
