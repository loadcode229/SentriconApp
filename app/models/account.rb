class Account < ApplicationRecord
  belongs_to :stations
  
  has_many :user_accounts
  has_many :users, through: :user_accounts

  validates :title, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  
end
