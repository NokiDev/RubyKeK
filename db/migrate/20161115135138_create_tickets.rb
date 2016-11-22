class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets, force: :cascade do |t|
      t.integer  :price, null:false
      t.datetime :bought_date, null: false
    end

    add_reference :tickets, :user , index:true, foreign_key:true
    add_reference :tickets, :concert , index:true, foreign_key:true

  end
end
