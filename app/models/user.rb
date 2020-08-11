class User < ApplicationRecord
    has_secure_password validations: false
    has_many :accounts_user
    has_many :accounts, through: :accounts_user
    before_validation :lowercase_email
    before_create :lowercase_email
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    def lowercase_email
        self.email.downcase!
    end
end
