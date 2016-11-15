class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name

      t.integer :age
      t.string :adress
      t.string :mail
      t.string :phone_number

      t.text :description

      t.timestamps :register_date
    end
  end
end