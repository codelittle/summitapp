class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :coach_id

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :coach_id
    add_index :relationships, [:user_id, :coach_id], unique: true
  end
end
