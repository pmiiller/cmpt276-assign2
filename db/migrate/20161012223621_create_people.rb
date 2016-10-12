class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :pname
      t.integer :age

      t.timestamps null: false
    end
  end
end
