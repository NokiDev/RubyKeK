class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, force: :cascade do |t|
      t.string   :username, null:false, unique: true
      t.string   :password, null:false
      t.string   :first_name
      t.string   :last_name
      t.integer  :age
      t.string   :adress
      t.string   :email, null: false, unique:true
      t.string   :phone_number
      t.text     :description, default: ''
      t.boolean :enabled, default: false
      t.string :activation_key, null: false
      t.string :status, default: 'none'
      t.datetime :created_at,   null: false
      t.datetime :updated_at,   null: false
    end
  end
end