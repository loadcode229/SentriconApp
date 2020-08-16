class User < ApplicationRecord
    has_secure_password

    has_many :user_accounts
    has_many :accounts, through: :user_accounts

    validates :username, presence: true
    validates :username, uniqueness: { case_sensitive: false }

    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
