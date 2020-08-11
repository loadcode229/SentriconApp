class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :address
      t.string :name
      t.string :phone_number
      t.string :instructions

      t.timestamps
    end
  end
end
