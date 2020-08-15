class User < ApplicationRecord
    has_secure_password validations: false
    has_many :accounts_user
    has_many :accounts, through: :accounts_user
    before_validation :lowercase_email
    before_create :lowercase_email
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    def lowercase_email
        self.email.downcase!
    end
end
