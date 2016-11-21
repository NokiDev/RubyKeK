class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.string :name
      t.date :date
      t.integer :remaining_tickets
      t.integer :price
      t.string :style
      t.string :address
      t.string :description
    end
  end
end
