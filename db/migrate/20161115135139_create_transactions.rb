class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.timestamps :bought_date

      t.references :ticket, index:true, foreign_key:true
      t.references :user, index:true, foreign_key:true
    end
  end
end
