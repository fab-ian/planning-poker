class DropGroupUser < ActiveRecord::Migration
  def change
    drop_table :group_users
  end
end
