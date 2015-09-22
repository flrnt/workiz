class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.references :collection, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :in_date
      t.datetime :out_date

      t.timestamps null: false
    end
  end
end
