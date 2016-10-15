class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :tokimon1
      t.integer :tokimon2
      t.integer :winner

      t.timestamps null: false
    end
  end
end
