class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :first_name
      t.string :last_name
      t.string :login
      t.string :repo

      t.timestamps
    end
  end
end
