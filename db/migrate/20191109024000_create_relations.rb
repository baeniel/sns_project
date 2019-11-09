class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.integer :following_id
      t.integer :follower_id
      t.timestamps
    end
    add_index :relations, :following_id
    add_index :relations, :follower_id
    add_index :relations, [:following_id, :follower_id], unique: true
  end
end
