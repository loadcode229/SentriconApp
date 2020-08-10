class Station < ApplicationRecord
  belongs_to :user
  belongs_to :accounts
end
