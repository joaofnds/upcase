class CreateFollowingRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :following_relationships do |t|
      t.references :followed, foreign_key: { to_table: :users }
      t.references :follower, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
