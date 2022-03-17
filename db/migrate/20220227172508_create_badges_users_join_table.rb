class CreateBadgesUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :users do |t|
      t.index [:user_id, :badge_id]
    end
  end
end
