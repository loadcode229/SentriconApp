class Account < ApplicationRecord
  belongs_to :station
  has_many :accounts_user
  has_many :users, through: :accounts_user
  validates :name, presence: true
  
end
