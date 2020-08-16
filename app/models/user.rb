class User < ApplicationRecord
    has_secure_password

    has_many :user_accounts
    has_many :accounts, through: :user_accounts

    validates :username, presence: true
    validates :username, uniqueness: { case_sensitive: false }

    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    validates :password, length: { minimum: 6, too_long: "%{count} characters is the minimum allowed" }

    def self.chop_email(user_id)
        self.find(user_id).email.scan(/(^\w|)/)[0].first
    end

end
