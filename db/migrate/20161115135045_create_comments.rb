class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments, force: :cascade do |t|
      t.datetime :created_at, null: false
      t.string   :comment
      t.datetime :updated_at, null: false
    end

    add_reference :comments, :user , index:true, foreign_key:true
    add_reference :comments, :concert , index:true, foreign_key:true

  end
end
