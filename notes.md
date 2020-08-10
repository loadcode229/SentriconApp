Sentricon App

User
    has_many :accounts
    has_many :stations, through: :accounts

    -name(string)
    -email(string)
    -password_digest(string)

Accounts
    belongs_to :user
    has_many :stations
    has_many :users, through :stations

    -content
        -name(string)
        -address(string)
        -phone_number(string)
        -instructions(string)

Stations
    belongs_to :user
    belongs_to :accounts

    -content
        -station_number(int)
        -active/non-active(boolean)