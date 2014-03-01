class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :frequency
      t.string :kind
      t.integer :minimum

      t.timestamps
    end
  end
end
