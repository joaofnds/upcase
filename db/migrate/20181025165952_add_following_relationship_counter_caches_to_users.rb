class AddFollowingRelationshipCounterCachesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :followers_count, :integer, null: false, default: 0
    add_column :users, :followeds_count, :integer, null: false, default: 0
  end
end
