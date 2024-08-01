class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.integer :follower_id, null: false
      t.integer :leader_id, null: false

      t.timestamps
    end

    add_index :subscriptions, :follower_id
    add_index :subscriptions, :leader_id
    add_index :subscriptions, [:follower_id, :leader_id], unique: true
  end
end
